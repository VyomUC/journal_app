import 'package:flutter/material.dart';
import 'new_entry_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> journalEntries = [];

  void addNewJournalEntry(String entry) {
    setState(() {
      journalEntries.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', fit: BoxFit.cover, height: 56,), // Logo
            const SizedBox(width: 8), // Add some space between the logo and the text
            const Text('Journal'), // Your app name here
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.deepPurple.shade800], // Corrected color access
          ),
        ),
        child: journalEntries.isEmpty
            ? const Center(
          child: Text(
            'Create your personal journal.\nTap the plus button to get started.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        )
            : ListView.builder(
          itemCount: journalEntries.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple[100], // Optional: Adjust card color for your theme
              child: ListTile(
                title: Text(journalEntries[index], style: const TextStyle(color: Colors.deepPurple)),
                subtitle: Text('Entry ${index + 1}', style: TextStyle(color: Colors.deepPurple.shade300)),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewEntryPage(onNewEntryAdded: addNewJournalEntry),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}