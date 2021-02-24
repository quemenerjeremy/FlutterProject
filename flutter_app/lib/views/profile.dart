import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/profile_card.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/save_picture.dart';

const UserName = "Jérémy Quemener";
const Country = "France";
const DarkMode = "Off";
const FavoriteCategorie = "FavoriteCategorie";

class ProfilPage extends StatefulWidget {

  @override
  _ProfilPageState createState() => _ProfilPageState();

}

class _ProfilPageState extends State<ProfilPage> {

  Image image;

  pickImage(ImageSource source) async {

    final _pickImage = await ImagePicker.pickImage(source: source);

    if (_pickImage != null) {
      setState(() {
        image = Image.file(_pickImage);
      });
      ImageSharedPrefs.saveImageToPrefs(
          ImageSharedPrefs.base64String(_pickImage.readAsBytesSync()));
    } else {
      print('Error picking image');
    }
    print("pickImage");
    print(image);
  }

  loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString(IMAGE_KEY);
    if (imageKeyValue != null) {
      final imageString = await ImageSharedPrefs.loadImageFromPrefs();
      setState(() {
        image = ImageSharedPrefs.imageFrom64BaseString(imageString);
      });
    }
    print("loadimage");
    print(image);
  }

  @override
  void initState() {
    super.initState();
    loadImageFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 80,
                child: image == null ? Text("Picture") : null,
                backgroundImage:
                  image != null ? image.image : null,
                ),
            ),
           IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  ImageSharedPrefs.emptyPrefs();
                  setState(() {
                    image = null;
                  });
                }
            ),
            TextButton(
              child: Text('Upload photo'),
              onPressed: () {
                _showPickOptionsDialog(context);
              },
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
                icon: Icons.public,
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



  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Take a picture"),
              onTap: () {
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

}

