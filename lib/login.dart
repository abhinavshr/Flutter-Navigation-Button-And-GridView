import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app/postFeed.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _loginResponse;

  Future<void> _login() async {
    Navigator.of(context).pushNamed('/secondScreen');
    // setState(() {
    //   _isLoading = true;
    //   _loginResponse = null;
    // });
    //
    // final url = Uri.parse('https://dummyjson.com/auth/login');
    // final response = await http.post(
    //   url,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'username': _emailController.text,
    //     'password': _passwordController.text,
    //     'expiresInMins': 60,
    //   }),
    // );
    //
    // setState(() {
    //   _isLoading = false;
    //
    // });
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   // final data = jsonDecode(response.body);
    //   // _loginResponse = 'Login Successful: ${data['accessToken']}';
    //   // Navigator.of(context).pushNamed('postFeed');
    //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PostFeed()));
    // } else {
    //   _loginResponse = 'Login Failed: ${response.body}';
    // }
    //
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text(_loginResponse ?? 'Something went wrong')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Login'),
          ),
        ),
        if (_loginResponse != null) ...[
          const SizedBox(height: 16),
          Text(
            _loginResponse!,
            style: TextStyle(
              color: _loginResponse!.contains('Successful') ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
