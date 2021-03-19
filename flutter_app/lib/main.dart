import 'package:flutter/material.dart';
import 'package:flutter_app/views/master_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/views/page_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/models/controlTheme.dart';

// Création de 2 themes light & dark

final darkTheme = ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.grey,
    primaryColorDark: Colors.blueGrey,
    brightness: Brightness.dark,
    hintColor: Colors.blueGrey,
    backgroundColor: Colors.black,
    accentColor: Colors.cyan,
    dividerColor: Colors.white54
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

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var isDarkTheme = prefs.getBool((SharedPreferencesTheme.DarkTheme));
  ThemeData theme;
  if(isDarkTheme != null) {
    theme = isDarkTheme ? darkTheme : lightTheme;
  } else {
    theme = lightTheme;
  }

  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(theme),
    child: NewsAppMvc(),
  )
  );
}

// Classe de notre appication

class NewsAppMvc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App MVC",
      // Selecteur de theme
      theme: themeNotifier.getTheme(),
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