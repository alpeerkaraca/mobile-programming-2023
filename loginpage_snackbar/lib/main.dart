import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 64.0),
            Container(
              margin: const EdgeInsets.all(15.0),
              height: 80.0,
              child: const FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 512,
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (username.isEmpty || password.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Bilgiler boş olamaz!"),
                    ),
                  );
                }
                
                else if (username == 'user' && password == 'password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Giriş Başarılı! $username:$password'),
                    ),
                  );
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Girilen Bilgiler Yanlış.\n $username:$password"),
                    ),
                  );
                }



              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(250, 20),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            Container(
              margin: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                },
                child: const Text(
                  'New User? Create Account',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}