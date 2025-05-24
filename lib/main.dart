import 'package:flutter/material.dart';
import 'package:projet2/myMind.dart';
import 'package:projet2/profile_info.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "projet2",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Connexion',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'PERFORMANCE WORKING\nBy OJ SPORTS CONSEIL.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () { 
               Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BodyPage(),
                    ));
              },
              child: Text(
                'Connexion',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ));
                },
                child: Text(
                  'Pas de compte? Inscrivez-vous !',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

handleSubmit (BuildContext context) {
  // Vérification des informations d'identification
              if (_formkey.currentState!.validate()){
                var username = usernameController.text.trim();
                var password = passwordController.text.trim();
                if (username == 'rias' && password == 'ucao') {
                  // Navigation vers la page des informations du profil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Connexion réussie'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  // Affichage d'un message d'erreur
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nom d\'utilisateur ou mot de passe incorrect'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }}
}
}
