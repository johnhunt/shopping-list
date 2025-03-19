import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 119, 12, 12)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shopping'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to store shopping items
  List<String> items = [];

  // Controller for the TextField to retrieve its value
  final TextEditingController _textController = TextEditingController();

  // Function to add an item to the list
  void _addItem() {
    setState(() {
      if (_textController.text.isNotEmpty) {
        items.add(_textController.text); // Add the text to the list
        _textController.clear(); // Clear the TextField after adding
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the top-left
          children: <Widget>[
            const Text(
              'Shopping List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Header styling
            ),
            const SizedBox(height: 16), // Add space between header and TextField
            TextField(
              key: const Key('shopping-list-textfield'),
              controller: _textController, // Attach the controller
              decoration: const InputDecoration(
                hintText: 'Enter an item',
                border: OutlineInputBorder(), // Add a border for better UI
              ),
            ),
            const SizedBox(height: 8), // Add space between TextField and button
            ElevatedButton(
              onPressed: _addItem, // Call _addItem when pressed
              child: const Text('Add'),
            ),
            const SizedBox(height: 16), // Add space between button and items list
            const Text(
              'Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Subheader styling
            ),
            const SizedBox(height: 8), // Add space between subheader and list
            // Display the list of items
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
