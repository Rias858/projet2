import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:projet2/main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
    Country? _selectedCountry;
  TextEditingController countryController = TextEditingController();
  XFile? _imageFile; // Image sélectionnée
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile; // Mettre à jour avec l'image sélectionnée
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
        appBar: AppBar(
        title: Center(child: Text('Informations du compte',style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
            // Action pour le bouton retour
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(height: 16),
              TextField(
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  labelText: 'Nom*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  labelText: 'Prenom*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),         
                  labelText: 'Email*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  labelText: 'Mot de passe*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              //Profil
              Row(children: [Padding(padding: EdgeInsets.symmetric(vertical: 30),
              child: Text("PROFILE", style: TextStyle(color: Colors.grey)))]),
              GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.photo),
                            title: Text('Galerie'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImage(ImageSource.gallery);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text('Appareil photo'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImage(ImageSource.camera);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: _imageFile != null
                    ? ClipOval(
                        child: Image.file(File(_imageFile!.path),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.black,
                      ),
              ),
            ),
            SizedBox(height: 16),      
              Text(
                'Téléchargez votre photo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  labelText: 'Taille (cm)*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  labelText: 'Poids (kg)*',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false, // Ne pas afficher les codes téléphoniques
                  onSelect: (Country country) {
                    setState(() { _selectedCountry = country;          
                    });
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    if (_selectedCountry != null)
                      Image.asset('assets/images/flags/flag-icons-main/flag-icons-main/flags/1x1/ad.svg',
                      width: 24,
                      height: 24,
                      ),
                    if (_selectedCountry != null) SizedBox(width: 8),
                    Text(
                      _selectedCountry != null
                          ? _selectedCountry!.name
                          : 'Sélectionnez un pays',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ))),
              SizedBox(height: 16),
              Text(
                'EQUIPE NATIONALE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: Text('OUI',style: TextStyle(color: Colors.white)),
                      value: true,
                      groupValue: true,
                      onChanged: (value) {
                        // Action pour choisir "OUI"
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: Text('NON',style: TextStyle(color: Colors.white)),
                      value: false,
                      groupValue: false,
                      onChanged: (value) {
                        // Action pour choisir "NON"
                      },
                    ),
                  ),
                ],
              ),
// Section pour "RECHERCHER VOTRE CLUB"
 Text('RECHERCHER VOTRE CLUB',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  hintText: 'Tapez votre recherche...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Section pour "DURÉE DE CONTRAT"
              Text(
                'DURÉE DE CONTRAT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              ListView(
                shrinkWrap: true,
                children: List.generate(
                  5,
                  (index) => Padding(padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    onPressed: () {// Action pour sélectionner la durée
                    },
                    child: Text('${index + 1}'),
                  )),
                ),
              ),
              SizedBox(height: 16),

              // Section pour "POSTE SUR LE TERRAIN"
              Text(
                'POSTE SUR LE TERRAIN',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 66, 64, 64),
                  hintText: 'Sélectionnez votre poste...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Gardien',
                  'Défenseur',
                  'Milieu',
                  'Attaquant',
                ].map((post) => DropdownMenuItem(
                      value: post,
                      child: Text(post),
                    )).toList(),
                onChanged: (value) {
                  // Action pour sélectionner le poste
                },
              ),
              SizedBox(height: 16),

              // Bouton "Continuer"
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  onPressed: () {
                    // Action pour continuer
                  },
                  child: Text(
                    'Continuer',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              )])))));
  }
}