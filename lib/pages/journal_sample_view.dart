import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp/pages/trade_pie_chart.dart';

class JournalSampleView extends StatefulWidget {
  const JournalSampleView({super.key});

  @override
  State<JournalSampleView> createState() => _JournalSampleViewState();
}

class _JournalSampleViewState extends State<JournalSampleView> {
  List<Map<String, dynamic>> journalEntries = [];

  @override
  void initState() {
    super.initState();
    loadJournalData();
  }

  Future<void> loadJournalData() async {
    final String response = await rootBundle.loadString(
      'assets/sample_journal_data.json',
    );
    final data = json.decode(response) as List;
    setState(() {
      journalEntries =
          data.map((entry) => Map<String, dynamic>.from(entry)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
        backgroundColor: Colors.deepPurple,
      ),
      body: journalEntries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                // ✅ Pie Chart at the top
                Center(child: TradePieChart(journalData: journalEntries)),
                const SizedBox(height: 16),
                // ✅ Entries List reversed
                ...journalEntries
                    .asMap()
                    .entries
                    .toList()
                    .reversed
                    .map((entry) {
                  final index = entry.key + 1; // Trade 1 is most recent
                  final data = entry.value;

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Trade $index",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("Pair", data["pair"]),
                                    _entryRow("Session", data["session"]),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("Date", data["date"]),
                                    _entryRow("Time", data["time"]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("Buy", data["buy"] ? "Yes" : "No"),
                                    _entryRow("Sell", data["sell"] ? "Yes" : "No"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("Win", data["win"] ? "Yes" : "No"),
                                    _entryRow("Fail", data["fail"] ? "Yes" : "No"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("Entry", data["entry"]),
                                    _entryRow("TP", data["tp"]),
                                    _entryRow("SL", data["sl"]),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _entryRow("TP(\$)", data["tp_dollar"]),
                                    _entryRow("SL(\$)", data["sl_dollar"]),
                                    _entryRow("R:R", data["rr"]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          _entryRow("Reason", data["reason"]),
                          _entryRow("Note", data["note"]),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
    );
  }

  Widget _entryRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Expanded(
            child: Text(
              "$value",
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
