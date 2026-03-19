// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: The chat helps guide you through the process, teaching you step-by-step and explaining why things are the way they are,
// Why redddd
// ============================================
//
// EXPLANATION (in my own words):
// Help me to do lab by teaching me step by step to finish this lab and why reddd
//
// VERIFICATION:
// I understandmore about json Data model json > class > object and why reddd
//
// MODIFICATIONS:
// Solution: Added headers to resolve university network issues.
// Author: Tanakrit Waree
// Date: 2026-03-19
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tanakrit_async_exercises/models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    // ✅ แก้: เพิ่ม headers เพื่อแก้ปัญหา university network
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Connection': 'keep-alive',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        user = User.fromJson(data);
      });
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Call API by Tanakrit 4808')),
      body: Center(
        child: user == null
            ? const CircularProgressIndicator()
            : RichText(
                text: TextSpan(
                  children: [
                    // ✅ แก้: ใช้ titleLarge + bodyMedium fontSize ตาม requirement
                    TextSpan(
                      text: user!.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' works at ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20, 
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: user!.company,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 20, 
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
