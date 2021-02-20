import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/profile_card.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

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

  File _StoreImage;

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
                child: _StoreImage == null ? Text("Picture") : null,
                backgroundImage:
                  _StoreImage != null ? FileImage(_StoreImage) : null,
                ),
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

  Future<void> _loadPicker(ImageSource source) async {
    final imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile == null) {
      setState(() {
        _StoreImage = imageFile;
      });
    }

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    Navigator.pop(context);

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
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a picture"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }

}

