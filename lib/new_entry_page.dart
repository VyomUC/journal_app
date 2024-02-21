import 'package:flutter/material.dart';
import 'entry_creation_page.dart';

class NewEntryPage extends StatelessWidget {
  final Function(String) onNewEntryAdded;

  NewEntryPage({required this.onNewEntryAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('New Entry', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.deepPurple.shade800],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EntryCreationPage(
                      onEntryCreation: (entry) {
                        onNewEntryAdded(entry);
                        Navigator.of(context).pop(); // Pop the EntryCreationPage.
                      },
                    ),
                  ),
                ),
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Create New Entry', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade700, // Deep purple button
                  onPrimary: Colors.white, // Text color
                ),
              ),
            ),
            // Reflection prompts go here.
            ReflectionPrompt(prompt: "Write down one thing you're grateful for and think about why you appreciate it so much."),
            ReflectionPrompt(prompt: "Write about what you notice."),
            ReflectionPrompt(prompt: "Who is your wisest friend? What have you learned from them recently?"),
            // More prompts can be added here.
          ],
        ),
      ),
    );
  }
}

class ReflectionPrompt extends StatelessWidget {
  final String prompt;

  ReflectionPrompt({required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade400, // Adjusted card color to match the theme
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          prompt,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
