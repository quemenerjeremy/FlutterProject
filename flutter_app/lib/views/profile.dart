import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/usernameDialog.dart';
import 'package:flutter_app/models/sharedUserData.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/save_picture.dart';
import 'package:flutter_app/views/SelectFavCategorie.dart';
import 'package:flutter_app/views/selectCountry.dart';
import 'package:flutter_app/custom_widgets/SwitchAppTheme.dart';
import 'package:flutter_app/models/user.dart';

class ProfilPage extends StatefulWidget {

  @override
  _ProfilPageState createState() => _ProfilPageState();

}

class _ProfilPageState extends State<ProfilPage> {
  User _user;
  bool _isLoading = false;
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
  }

  @override
  void initState() {
    super.initState();
    _setUserInfos();
    loadImageFromPrefs();
  }

  _setUserInfos() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var isUserExist = User.fromJson(await SharedPrefUser().getUser());
      if (isUserExist != null) {
        setState(() {
          _user = isUserExist;
        });
      }
    } catch(err) {
      setState(() {
        print(err);
        _user = User();
      });
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: _isLoading ? Padding(padding: EdgeInsets.only(top: 300), child: Center(child: CircularProgressIndicator())) : SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      child: image == null ? Text("Picture") : null,
                      backgroundImage:
                      image != null ? image.image : null,
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text('Upload photo'),
                        onPressed: () {
                          _showPickOptionsDialog(context);
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.delete_forever),
                          onPressed: () {
                            ImageSharedPrefs.emptyPrefs();
                            setState(() {
                              image = null;
                            });
                          }),
                    ]
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.cyan,
                    ),
                    title: Text("${_user.username}",  style: TextStyle(color: Theme.of(context).primaryColorDark)),
                    onTap: () {
                      usernameDialog(context).then((value) async {
                        if (value != null) {
                          setState(() {
                            _user.username = value;
                          });
                          await SharedPrefUser().saveUser(_user);
                        }
                      });
                    },
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.public,
                      color: Colors.cyan,
                    ),
                    title: Text(
                        "Country", style: TextStyle(color:Theme.of(context).primaryColorDark)
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => choiceCountry(country: _user.country)))
                      .then((value) async {
                        if (value != null) {
                          setState(() {
                            _user.country = value;
                          });
                        }
                        await SharedPrefUser().saveUser(_user);
                      });
                    },
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.brightness_6,
                      color: Colors.cyan,
                    ),
                    title: Text(
                        "Dark Mode", style: TextStyle(color:Theme.of(context).primaryColorDark)
                    ),
                    trailing: ThemeSwitch()
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite_border,
                      color: Colors.cyan,
                    ),
                    title: Text(
                        "Favorite Article", style: TextStyle(color:Theme.of(context).primaryColorDark)
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => FavCategories(check: _user.selectTopic, listTopics: _user.listTopics,))).then((value) async {
                            if (value != null) {
                              setState(() {
                                _user.selectTopic = value["boolTab"];
                                _user.listTopics = value["stringTab"];
                              });
                              await SharedPrefUser().saveUser(_user);
                            }
                          });
                      },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
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
