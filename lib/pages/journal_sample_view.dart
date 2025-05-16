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
      body:
          journalEntries.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  // ✅ Pie Chart at the top
                  Center(child: TradePieChart(journalData: journalEntries)),
                  const SizedBox(height: 16),
                  // ✅ Entries List
                  ...journalEntries.map(
                    (entry) => Card(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow("Pair", entry["pair"]),
                                      _entryRow("Session", entry["session"]),
                                    ],
                                  ),
                                ),
                                // Right column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow("Date", entry["date"]),
                                      _entryRow("Time", entry["time"]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow(
                                        "Buy",
                                        entry["buy"] ? "Yes" : "No",
                                      ),
                                      _entryRow(
                                        "Sell",
                                        entry["sell"] ? "Yes" : "No",
                                      ),
                                    ],
                                  ),
                                ),
                                // Right column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow(
                                        "Win",
                                        entry["win"] ? "Yes" : "No",
                                      ),
                                      _entryRow(
                                        "Fail",
                                        entry["fail"] ? "Yes" : "No",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow("Entry", entry["entry"]),
                                      _entryRow("TP", entry["tp"]),
                                      _entryRow("SL", entry["sl"]),
                                    ],
                                  ),
                                ),
                                // Right column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _entryRow("TP(\$)", entry["tp_dollar"]),
                                      _entryRow("SL(\$)", entry["sl_dollar"]),
                                      _entryRow("R:R", entry["rr"]),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Divider(),
                            _entryRow("Reason", entry["reason"]),
                            _entryRow("Note", entry["note"]),
                          ],
                        ),
                      ),
                    ),
                  ),
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
          Expanded(child: Text("$value", style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
