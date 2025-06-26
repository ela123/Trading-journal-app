import 'package:flutter/material.dart';
import 'appbar.dart';

class TradeJournal extends StatelessWidget {
  const TradeJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Journal", leadingIcon: null),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15.0),
                    customTextFormField(context, 'Pair', 'Enter Pair'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buysell(context, 'Buy', false),
                        buysell(context, 'Sell', false),
                        buysell(context, 'Win', false),
                        buysell(context, 'Fail', false),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallfilds(context, "Margin", "Margin"),
                        smallfilds(context, "Lots", "Lots"),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallfilds(context, "Entry", "Entry"),
                        smallfilds(context, "TP", "TP"),
                        smallfilds(context, "SL", "SL"),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallfilds(context, "TP[\$]", "TP[\$] "),
                        smallfilds(context, "SL[\$]", "SL[\$]"),
                        smallfilds(context, "R:R", "R:R"),
                      ],
                    ),
                    Row(
                      children: [
                        smallfildsDate(context, 'Date'),
                        smallfilds(context, 'Time', 'HH:MM'),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    sessionDropdownField(label: 'Session'),
                    const SizedBox(height: 10.0),
                    paragraphField('Reason'),
                    const SizedBox(height: 10.0),
                    paragraphField('Note'),
                    const SizedBox(height: 10.0),
                    journalbutton(context),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget customTextFormField(BuildContext context, String name, String hint) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8),
    child: TextFormField(
      decoration: InputDecoration(
        label: Text(name),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget buysell(BuildContext context, String text, bool value) {
  return Row(
    children: [
      Row(
        children: [
          Text(text, style: TextStyle(color: Colors.black, fontSize: 14)),
          Checkbox(
            value: value,
            onChanged: (bool? value) {},
            activeColor:
                Theme.of(
                  context,
                ).primaryColor, // Or replace with a specific color
          ),
        ],
      ),
    ],
  );
}

Widget smallfilds(BuildContext context, String label, String hint) {
  return Flexible(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          hintStyle: const TextStyle(color: Colors.black26, fontSize: 12),
          labelStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(fontSize: 12),
      ),
    ),
  );
}

Widget smallfildsDate(BuildContext context, String label) {
  final TextEditingController controller = TextEditingController();
  final String currentDate =
      DateTime.now().toLocal().toString().split(' ')[0]; // yyyy-mm-dd

  return Flexible(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
      child: GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            controller.text = picked.toLocal().toString().split(' ')[0];
          }
        },
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: currentDate,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              hintStyle: const TextStyle(color: Colors.black26, fontSize: 12),
              labelStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    ),
  );
}
Widget paragraphField(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: TextFormField(
      maxLines: null,
      //minLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    ),
  );
}
Widget journalbutton(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // TODO: Add sign-up logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Add Journal',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.045,
        ),
      ),
    ),
  );
}
Widget sessionDropdownField({required String label}) {
  final List<String> sessions = ['Asian', 'New York', 'London'];
  String? selectedSession;

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          value: selectedSession,
          items: sessions.map((session) {
            return DropdownMenuItem<String>(
              value: session,
              child: Text(session),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedSession = value;
            });
          },
        ),
      );
    },
  );
}
