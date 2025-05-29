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




Widget loginoption(BuildContext context) {
    return Column(
        children: [
              // Divider with "Sign up with" text
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                              Expanded(
                                                          child: Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5)),
                                                                    ),
                                                                              const Padding(
                                                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                                      child: Text(
                                                                                                                    'Sign up with',
                                                                                                                                  style: TextStyle(color: Colors.black45),
                                                                                                                                              ),
                                                                                                                                                        ),
                                                                                                                                                                  Expanded(
                                                                                                                                                                              child: Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5)),
                                                                                                                                                                                        ),
                                                                                                                                                                                                ],
                                                                                                                                                                                                      ),
                                                                                                                                                                                                            const SizedBox(height: 25.0),

                                                                                                                                                                                                                  // Corrected Icons Row
                                                                                                                                                                                                                        Row(
                                                                                                                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                                                                                                                                        children: const [
                                                                                                                                                                                                                                                  Logo(FontAwesomeIcons.facebookF),
                                                                                                                                                                                                                                                            Logo(FontAwesomeIcons.twitter),
                                                                                                                                                                                                                                                                      Logo(FontAwesomeIcons.google),
                                                                                                                                                                                                                                                                                Logo(FontAwesomeIcons.apple),
                                                                                                                                                                                                                                                                                        ],
                                                                                                                                                                                                                                                                                              ),
                                                                                                                                                                                                                                                                                                    const SizedBox(height: 25.0),

                                                                                                                                                                                                                                                                                                          // Sign-up redirect
                                                                                                                                                                                                                                                                                                                Row(
                                                                                                                                                                                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                                                                                                                                                                                children: [
                                                                                                                                                                                                                                                                                                                                          const Text(
                                                                                                                                                                                                                                                                                                                                                      'Don\'t have an account? ',
                                                                                                                                                                                                                                                                                                                                                                  style: TextStyle(color: Colors.black45),
                                                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                                                      GestureDetector(
                                                                                                                                                                                                                                                                                                                                                                                                  onTap: () {
                                                                                                                                                                                                                                                                                                                                                                                                                Navigator.push(
                                                                                                                                                                                                                                                                                                                                                                                                                                context,
                                                                                                                                                                                                                                                                                                                                                                                                                                                MaterialPageRoute(builder: (context) => const Signup()),
                                                                                                                                                                                                                                                                                                                                                                                                                                                              );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                          },
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      child: Text(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    'Sign up',
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  style: TextStyle(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  color: Theme.of(context).colorScheme.primary,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
}