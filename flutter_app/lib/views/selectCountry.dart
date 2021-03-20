import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserData.dart';

enum CountryList {fr, us, gb, be, de}

class choiceCountry extends StatefulWidget {

  final country;
  choiceCountry({Key key, this.country}) : super(key: key);

  @override
  _choiceCountryState createState() => _choiceCountryState();
}

class _choiceCountryState extends State<choiceCountry> {
  CountryList _countryList = CountryList.gb;

  @override
  void initState() {
    super.initState();
    _countryChange();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Choice country',
          style: TextStyle(fontSize: 25, color: Theme.of(context).accentColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
                title: const Text("France"),
                value: CountryList.fr,
                groupValue: _countryList,
                onChanged: (CountryList value) {setState(() {_countryList = value;});}
            ),
            RadioListTile(
                title: const Text("Belgium"),
                value: CountryList.be,
                groupValue: _countryList,
                onChanged: (CountryList value) {setState(() {_countryList = value;});}
            ),
            RadioListTile(
                title: const Text("Germany"),
                value: CountryList.de,
                groupValue: _countryList,
                onChanged: (CountryList value) {setState(() {_countryList = value;});}
            ),
            RadioListTile(
                title: const Text("United Kingdom"),
                value: CountryList.gb,
                groupValue: _countryList,
                onChanged: (CountryList value) {setState(() {_countryList = value;});}
            ),
            RadioListTile(
                title: const Text("United States"),
                value: CountryList.us,
                groupValue: _countryList,
                onChanged: (CountryList value) {setState(() {_countryList = value;});}
            ),
            SizedBox(
              height: 20,
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               OutlinedButton.icon(
                    label: Text("Submit", style: TextStyle(color:Theme.of(context).accentColor)),
                    icon: Icon(Icons.done, color: Colors.greenAccent),
                    onPressed: () {Navigator.pop(context, _countryList.toString().split('.').last);},
                  ),
              ],
            )
          ]
      )
    );
  }

  _countryChange() {
    switch (widget.country) {
      case "fr":
        _countryList = CountryList.fr;
        break;
      case "be":
        _countryList = CountryList.be;
        break;
      case "de":
        _countryList = CountryList.de;
        break;
      case "gb":
        _countryList = CountryList.gb;
        break;
      case "us":
        _countryList = CountryList.us;
        break;
    }
    setState(() {});
  }
}