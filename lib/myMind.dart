import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyPage extends StatefulWidget {
  @override
  BodyPageState createState() => BodyPageState();
}

class BodyPageState extends State<BodyPage> {
  String hoveredPart = '';

  void showPainDialog(String partName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(255, 38, 37, 37),
          title: Center(
            child: Text(
              'Douleur - $partName',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Échelle de douleur visuelle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Icon(
                    Icons.circle,
                    color: index == 0 ? Colors.green : (index == 1 ? Colors.yellow : (index == 2 ? Colors.orange : Colors.red)),
                    size: 30,
                  );
                }),
              ),
              SizedBox(height: 10),
              Text(
                'Évaluer votre douleur',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 15),
              // Champ de texte pour les remarques
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  labelText: 'Remarque',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Décrivez votre douleur...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Valider'),
            ),
          ],
        );
      },
    );
  }

  Widget bodyPart(String assetPath, double top, double left, String partName, {double? width}) {
    return Positioned(
      top: top,
      left: left,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hoveredPart = partName;
          });
        },
        onExit: (_) {
          setState(() {
            hoveredPart = '';
          });
        },
        child: GestureDetector(
          onTap: () {
            showPainDialog(partName);
          },
          child: SvgPicture.asset(
            assetPath,
            width: width,
            color: hoveredPart == partName ? Colors.red : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 37, 37),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('My Mind', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          bodyPart('assets/images/body/cou.svg', 73, 210, 'Cou'),
          bodyPart('assets/images/body/tete.svg', 5, 195, 'Tête', width: 110),
          bodyPart('assets/images/body/Avant_bras_droit.svg', 280, 100, 'Avant-bras droit'),
          bodyPart('assets/images/body/Avant_bras_gauche.svg', 290, 358, 'Avant-bras gauche'),
          bodyPart('assets/images/body/Biceps_droit_et_coude.svg', 195, 108, 'Biceps droit et coude'),
          bodyPart('assets/images/body/Biceps_gauche.svg', 199, 355, 'Biceps gauche'),
          bodyPart('assets/images/body/epaule_droite.svg', 109, 107, 'Epaule droite', width: 120),
          bodyPart('assets/images/body/epaule_gauche.svg', 110, 275, 'Epaule gauche', width: 120),
          bodyPart('assets/images/body/main_droite.svg', 400, 95, 'Main droite', width: 50),
          bodyPart('assets/images/body/main_gauche.svg', 400, 390, 'Main gauche', width: 50),
          bodyPart('assets/images/body/poitrine_droite.svg', 150, 160, 'Poitrine droite'),
          bodyPart('assets/images/body/Poitrine_gauche.svg', 150, 250, 'Poitrine gauche'),
          bodyPart('assets/images/body/Poitrine_gauche.svg', 150, 250, 'Poitrine gauche'),
          bodyPart('assets/images/body/abdo.svg', 194, 170, 'Abdominaux'),
          bodyPart('assets/images/body/Pubis.svg', 250, 190, 'Pubis'),
          bodyPart('assets/images/body/cuisse-droite.svg', 320, 180, 'Cuisse droite'),
          bodyPart('assets/images/body/cuisse_gauche.svg', 320, 230, 'Cuisse gauche'),
          bodyPart('assets/images/body/Genou_droit.svg', 380, 185, 'Genou droit'),
          bodyPart('assets/images/body/Genou_gauche.svg', 380, 235, 'Genou gauche'),
          bodyPart('assets/images/body/Mollet_droit.svg', 420, 175, 'Mollet droit'),
          bodyPart('assets/images/body/Mollet_tibia_gauche.svg', 420, 245, 'Mollet gauche'),
          bodyPart('assets/images/body/pied_droite.svg', 470, 170, 'Pied droit', width: 60),
          bodyPart('assets/images/body/Pied_gauche.svg', 470, 250, 'Pied gauche', width: 60),

          
        ],
      ),
    );
  }
}
