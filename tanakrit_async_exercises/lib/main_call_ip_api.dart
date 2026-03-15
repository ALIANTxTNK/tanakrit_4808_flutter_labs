// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: The chat helps guide you through the process, teaching you step-by-step and explaining why things are the way they are.
// ============================================
//
// EXPLANATION (in my own words):
// I use ai to teach me about apicall and async and help me todo this lab
//
// VERIFICATION:
// I understand more about api call and async and i can do this lab
//
// MODIFICATIONS:
// pubsec.yaml and more
// Author: Tanakrit Waree
// Date: 2026-03-15
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchIPAddress() async {
  final url = Uri.parse('https://api.ipify.org?format=json');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final ip = data['ip'];

    print('Your public IP address is: $ip');
  } else {
    print('Failed to fetch IP address');
  }
}

void main() async {
  await fetchIPAddress();
}
