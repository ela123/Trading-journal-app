import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  late WebSocketChannel channel;
  String currentPrice = 'Waiting...';

  @override
  void initState() {
    super.initState();

    // Example: Binance BTC/USDT stream (change if needed)
    channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade'),
    );

    channel.stream.listen((data) {
      final price = parsePrice(data); // Parse function defined below
      setState(() {
        currentPrice = price;
      });
    });
  }

  // Simple JSON parsing example
  String parsePrice(String data) {
    final match = RegExp(r'"p":"([\d.]+)"').firstMatch(data);
    return match != null ? match.group(1)! : 'N/A';
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live BTC Price")),
      body: Center(
        child: Text(
          "\$ $currentPrice",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
