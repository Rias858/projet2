import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
   BodyPageState createState() => BodyPageState();
}

class BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 38, 37, 37),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('My Mind',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
  child: Stack(
    children: [
      Padding(padding: EdgeInsets.only(top: 73,left: 210), child: 
      SvgPicture.asset('assets/images/body/cou.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 5,left: 195), child: 
      SvgPicture.asset('assets/images/body/tete.svg',width: 110)
      ),
      Padding(padding: EdgeInsets.only(top: 280, left: 100), child: 
      SvgPicture.asset('assets/images/body/Avant_bras_droit.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 290, left: 358), child: 
      SvgPicture.asset('assets/images/body/Avant_brad_gauche.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 195, left: 108), child: 
      SvgPicture.asset('assets/images/body/Biceps_droit_et_coude.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 199, left: 355), child: 
      SvgPicture.asset('assets/images/body/Biceps_gauche.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 109,left: 107), child: 
      SvgPicture.asset('assets/images/body/epaule_droite.svg',width: 120)
      ),
      Padding(padding: EdgeInsets.only(top: 110, left: 275), child: 
      SvgPicture.asset('assets/images/body/epaule_gauche.svg',width: 120)
      ),
      Padding(padding: EdgeInsets.only(top: 375, left: 80), child: 
      SvgPicture.asset('assets/images/body/Main_droite.svg',width: 50)
      ),
      Padding(padding: EdgeInsets.only(top: 376, left: 375), child: 
      SvgPicture.asset('assets/images/body/main_gauche.svg',width: 50)
      ),
      Padding(padding: EdgeInsets.only(top: 150, left: 160 ), child: 
      SvgPicture.asset('assets/images/body/poitrine_droite.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 150, left: 250), child: 
      SvgPicture.asset('assets/images/body/Poitrine_gauche.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 190, left: 170), child: 
      SvgPicture.asset('assets/images/body/abdo.svg')
      ),
      Padding(padding: EdgeInsets.only(top: 620, left: 155), child: 
      SvgPicture.asset('assets/images/body/Mollet_droit.svg',width: 65)
      ),
      Padding(padding: EdgeInsets.only(top: 630, left: 282), child: 
      SvgPicture.asset('assets/images/body/Mollet_tibia_gauche.svg',width: 65)
      ),
       Padding(padding: EdgeInsets.only(top: 363, left: 154), child: 
      SvgPicture.asset('assets/images/body/cuisse-droite.svg',width: 90)
      ),
      Padding(padding: EdgeInsets.only(top: 363, left: 260), child: 
      SvgPicture.asset('assets/images/body/cuisse_gauche.svg',width: 85),
      ),
      Padding(padding: EdgeInsets.only(top: 549, left: 160), child: 
      SvgPicture.asset('assets/images/body/Genou_droit.svg',width: 70)
      ),
      Padding(padding: EdgeInsets.only(top: 570, left: 275), child: 
      SvgPicture.asset('assets/images/body/Genou_gauche.svg',width: 70)
      ),
      Padding(padding: EdgeInsets.only(top: 340, left: 170), child: 
      SvgPicture.asset('assets/images/body/Pubis.svg',width: 168)
      ),
       Padding(padding: EdgeInsets.only(top: 730, left: 115), child: 
      SvgPicture.asset('assets/images/body/pied_droite.svg',width: 80)
      ),
      Padding(padding: EdgeInsets.only(top: 730, left: 305), child: 
      SvgPicture.asset('assets/images/body/Pied_gauche.svg',width: 80)
      )
    ],
  ),
),
    );
  }
}