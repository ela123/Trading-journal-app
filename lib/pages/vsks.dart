import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late WebSocketChannel btcChannel;
  String btcPrice = "Loading...";

  @override
  void initState() {
    super.initState();

    // Binance WebSocket for BTCUSDT
    btcChannel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade'),
    );

    btcChannel.stream.listen((data) {
      final jsonData = json.decode(data);
      final price = jsonData['p']; // 'p' = price
      setState(() {
        btcPrice = price;
      });
    });
  }

  @override
  void dispose() {
    btcChannel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices - WebSocket'),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('BTC / USDT'),
              subtitle: Text('Live Price: \$${btcPrice}'),
              trailing: const Icon(Icons.trending_up),
            ),
          ),
        ],
      ),
    );
  }
}
