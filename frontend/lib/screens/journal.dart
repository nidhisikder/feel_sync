import 'package:flutter/material.dart';


class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _controller = TextEditingController();
  String enteredText = '';
  @override
  void dispose() {
    // Important: Dispose of the controller to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }
  void _updateText() {
    setState(() {
      enteredText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Text(
              "How are you feeling today?",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),

            // Text Input for Journal Entry
            Expanded(
              child: TextField(
                maxLines: null,
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Write about your day or feelings...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Attachments Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.image),
                  tooltip: "Attach Image",
                  color: Colors.blue.shade700,
                  iconSize: 30.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                  tooltip: "Record Voice Note",
                  color: Colors.blue.shade700,
                  iconSize: 30.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.brush),
                  tooltip: "Add Drawing",
                  color: Colors.blue.shade700,
                  iconSize: 30.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Tags Section
            const Text(
              "Tag Your Entry",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: [
                Chip(
                  label: const Text("Gratitude"),
                  backgroundColor: Colors.blue.shade100,
                  onDeleted: () {},
                ),
                Chip(
                  label: const Text("Stress"),
                  backgroundColor: Colors.blue.shade100,
                  onDeleted: () {},
                ),
                Chip(
                  label: const Text("Anger"),
                  backgroundColor: Colors.blue.shade100,
                  onDeleted: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Search Journal Entries
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                "Search Entries",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
