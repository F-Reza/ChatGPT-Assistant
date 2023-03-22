

import 'dart:convert';

import 'package:http/http.dart' as http;

//Please Comment-out
//String apiKey = "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";

class ApiServices {

//Please Comment-out
  //static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  static sendMessage(String? message) async {
    var res = await http.post(Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": '$message',
        "max_tokens": 100,
        "temperature": 0,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["Human:", " AI:"]
      })
    );

    if(res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      var msg = data['choices'][0]['text'];
      return msg;
    } else {
      print("Failed to fatch data");
    }

  }


}