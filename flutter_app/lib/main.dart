import 'package:flutter/material.dart';
import 'package:flutter_app/views/master_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/views/page_details.dart';

// Création de 2 themes light & dark

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  accentColor: Colors.blueGrey,

);

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.cyan,
);

// Classe ThemeNotifier pour notifer l'app d'un changement de theme

class ThemeNotifier with ChangeNotifier {

  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

}

// Main fonction de l'application

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(lightTheme),
    child: NewsAppMvc(),
  )
  );
}

// Classe de notre appication

class NewsAppMvc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App MVC",
      // Selecteur de theme
      theme: darkTheme,
      // Ouvre initialement la MasterPage qui gere le header le bottomBar et son contenu
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return MasterPage();
        },
        '/PageDetails' : (BuildContext context) {
          return PageDetails();
        }
      },
    );
  }

}