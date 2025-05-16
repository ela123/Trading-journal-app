import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final String apiKey = '6395ba9ddbec4b53b0e8e3287064ca50';

  final List<String> symbols = [
    'US100',
    'XAU/USD',
    'EUR/USD',
    'BTC/USD',
    'GBP/JPY',
    'UUP'
  ];

  Map<String, dynamic> prices = {};
  Map<String, String> statuses = {};
  bool isLoading = true;
  Timer? refreshTimer;

  @override
  void initState() {
    super.initState();
    fetchPrices();

    // Auto-refresh every 1 minute
    refreshTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      fetchPrices();
    });
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> fetchPrices() async {
    try {
      Map<String, dynamic> tempPrices = {};
      Map<String, String> tempStatuses = {};

      for (String symbol in symbols) {
        final url =
            'https://api.twelvedata.com/time_series?symbol=$symbol&interval=1min&apikey=$apiKey&outputsize=1';
        final response = await http.get(Uri.parse(url));
        final data = json.decode(response.body);

        print('API response for $symbol: $data');

        if (data.containsKey('values')) {
          final closePrice = data['values'][0]['close'];
          final dateTimeStr = data['values'][0]['datetime'];
          final DateTime dataTime = DateTime.parse(dateTimeStr).toLocal();
          final Duration diff = DateTime.now().difference(dataTime);

          tempPrices[symbol] = closePrice;

          if (diff.inMinutes > 3) {
            tempStatuses[symbol] = 'Market Closed';
          } else {
            tempStatuses[symbol] = 'Live';
          }
        } else if (data.containsKey('message')) {
          tempPrices[symbol] = 'Error';
          tempStatuses[symbol] = 'Unavailable';
        } else {
          tempPrices[symbol] = 'N/A';
          tempStatuses[symbol] = 'Unavailable';
        }
      }

      setState(() {
        prices = tempPrices;
        statuses = tempStatuses;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching prices: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget statusLabel(String status) {
    if (status == 'Market Closed') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Closed',
          style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
        ),
      );
    } else if (status == 'Live') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Live',
          style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'N/A',
          style: TextStyle(color: Colors.grey[800]),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices'),
        backgroundColor: Colors.indigo,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchPrices,
              child: ListView.builder(
                itemCount: symbols.length,
                itemBuilder: (context, index) {
                  final symbol = symbols[index];
                  final price = prices[symbol];
                  final status = statuses[symbol];

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            symbol,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          statusLabel(status ?? 'Unknown'),
                        ],
                      ),
                      subtitle: Text(
                        price != null ? 'Price: $price' : 'Loading...',
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(Icons.trending_up),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
