import 'package:flutter/material.dart';
import 'journal.dart';
import 'market_page.dart';
import 'journal_sample_view.dart';
// import 'package:myapp/pages/trade_journal.dart';
// import 'package:myapp/pages/market_page.dart';
// import 'package:myapp/pages/journal_sample_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello Trader 👋",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "What would you like to do today?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),

            // ✅ Buttons
            _menuButton(
              context,
              icon: Icons.add,
              label: "Add Journal",
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const TradeJournal()));
              },
            ),
            _menuButton(
              context,
              icon: Icons.show_chart,
              label: "Market",
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const MarketPage()));
              },
            ),
            _menuButton(
              context,
              icon: Icons.book,
              label: "View Journal",
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const JournalSampleView()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.deepPurple),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
