import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String> usernameDialog(BuildContext context) {

  TextEditingController customController = TextEditingController();

  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Change username"),
      content: TextField(
        controller: customController,
        decoration: InputDecoration(
            labelText: "Username",
            hintText: "ex: John Doe"
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
            },
            child: Text("Submit"))
      ],
    );
  });
}

/*
Text("${this._user.username}",  style: TextStyle(color: Theme.of(context).primaryColorDark),,
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
 */
/*
TextField(
                      style: TextStyle(color: Theme.of(context).primaryColorDark),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Theme.of(context).primaryColorDark)
                      ),
                      onSubmitted: (String value) async {
                          if (value != null) {
                            setState(() {
                              _user.username = value;
                            });
                            await SharedPrefUser().saveUser(_user);
                          }
                      },
                    ),
 */