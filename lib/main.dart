import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/theme_provider.dart';
import 'package:flutter_provider_example/screens/random_user_detail_screen.dart';
import 'package:flutter_provider_example/screens/tab_screen.dart';
import 'package:flutter_provider_example/services/networking/random_user/providers/random_user_get_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeColorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RandomUserGetProvider(),
        ),
      ],

      child: Consumer<ThemeColorProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: 'Flutter provider example',
            home: TabScreen(),
            theme: ThemeData(
              primaryColor: provider.getPrimaryColor(),
              accentColor: provider.getAccentColor(),
              textTheme: TextTheme(
                headline1: TextStyle(fontSize: 72,),
                headline2: TextStyle(fontSize: 66,),
                headline3: TextStyle(fontSize: 60,),
                headline4: TextStyle(fontSize: 54,),
                headline5: TextStyle(fontSize: 48,),
                headline6: TextStyle(fontSize: 42,),
                bodyText1: TextStyle(fontSize: 24,),
                bodyText2: TextStyle(fontSize: 18,),
              ),
            ),
            routes: {
              RandomUserDetailScreen.id: (context) => RandomUserDetailScreen(),
            },
          );
        },
      ),
    );
  }
}

