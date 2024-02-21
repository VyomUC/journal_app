import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView( // Enables scrolling when keyboard is visible
        child: Container(
          width: double.infinity, // Ensures the container fills the screen width
          padding: EdgeInsets.symmetric(horizontal: 20.0), // Applies padding to the sides
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Provides top spacing
              Image.asset('assets/images/logo.png', width: 100), // Logo at the top of the login form
              SizedBox(height: 50), // Space after the logo before the login form
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _usernameController,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.white70),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.deepPurple[600],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.white70),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.deepPurple[600],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incorrect username or password'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Provides bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
