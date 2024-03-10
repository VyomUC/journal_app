import 'package:flutter/material.dart';

class EntryCreationPage extends StatefulWidget {
  final Function(String) onEntryCreation;

  const EntryCreationPage({super.key, required this.onEntryCreation});

  @override
  _EntryCreationPageState createState() => _EntryCreationPageState();
}

class _EntryCreationPageState extends State<EntryCreationPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white), // Ensure icon is visible against AppBar
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Create Entry', style: TextStyle(color: Colors.white)), // Ensure title is visible
        actions: [
          IconButton(
            icon: const Icon(Icons.done, color: Colors.white), // Ensure icon is visible against AppBar
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                widget.onEntryCreation(_textEditingController.text);
                Navigator.of(context).pop(); // Close the page after creating an entry
              }
            },
          ),
        ],
        backgroundColor: Colors.deepPurple, // Consistent with the theme
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.deepPurple.shade800], // Gradient background
          ),
        ),
        child: TextField(
          controller: _textEditingController,
          style: const TextStyle(color: Colors.white), // Ensure text is visible
          decoration: InputDecoration(
            hintText: 'Start writing your entry...',
            hintStyle: const TextStyle(color: Colors.white70), // Ensure hint text is visible
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade100), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade200), // Enabled state border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade300), // Focused state border
            ),
          ),
          maxLines: null, // Allow for multiple lines
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }
}