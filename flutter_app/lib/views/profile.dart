import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/profile_card.dart';

const UserName = "Jérémy Quemener";
const Country = "France";
const DarkMode = "Off";
const FavoriteCategorie = "FavoriteCategorie";

class ProfilPage extends StatefulWidget {

  @override
  _ProfilPageState createState() => _ProfilPageState();

}

class _ProfilPageState extends State<ProfilPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/pictureProfile.jpg'),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            InfoCard(
                text: UserName,
                icon: Icons.account_circle,
                onPressed: () {
                  print('username');
                },
            ),
            InfoCard(
                text: Country,
                icon: Icons.my_location,
                onPressed: () {
                  print('location');
                },
            ),
            InfoCard(
                text: DarkMode,
                icon: Icons.nightlight_round,
                onPressed: () {
                  print('dark');
                  },
            ),
            InfoCard(
              text: FavoriteCategorie,
              icon: Icons.favorite,
              onPressed: () {
                print('favorite');
              },
            ),


          ],
        ),
      )
    );
  }
}