import 'dart:convert';

import 'package:flutter/material.dart';



class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = []; // To store chat messages
  final TextEditingController messageController = TextEditingController();
  
  String? _prediction; // To display the prediction result

  Future<void> _sendInputToModel(String input) async {
    const String flaskUrl = 'http://127.0.0.1:5000/predict'; // Flask API endpoint
    try {
      final response = await http.post(
        Uri.parse(flaskUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'input': input}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          _prediction = responseData['prediction']; // Extract prediction
        });
      } else {
        setState(() {
          _prediction = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _prediction = 'Error: $e';
      });
    }
  }

  // Dictionary with predefined responses
  final Map<String, String> responseDictionary = {
    "hello": "Hi there! How can I help you?",
    "hi":"Heyy buddy Whatsup!!!",
    "how are you": "I am cool, How are you friend?",
    "bye": "Goodbye! Have a great day!"
  };

  void handleSendMessage() {
    String userMessage = messageController.text.trim().toLowerCase();
    if (userMessage.isNotEmpty) {
      
      setState(() {
        // Add user's message
        messages.add({"sender": "user", "text": userMessage});
        
       //}
       _sendInputToModel(userMessage);
                   // Send input to Flask
        //What I want to do is the usermessage will be first checked into this responsedictionary,
        ///if the usermessage is not here then it will be sent the model
        ///there whatever will be the highest emotion count
        ///that emotion's list will be checked
        ///and from the list randomly any message will be replied and this will go on.
        
        
        String botResponse= "";
        if(responseDictionary.containsKey(userMessage)){      
        String? botResponse =
            responseDictionary[userMessage];
        messages.add({"sender": "bot", "text": botResponse});
        }
        
        if(_prediction != null && botResponse==""){
          botResponse=_prediction;
        }
      messages.add({"sender": "bot", "text": botResponse});
      
      });
      messageController.clear(); // Clear input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['sender'] == "user";

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: handleSendMessage,
                  child: Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
