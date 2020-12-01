import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ThemeColor> _primaryColors =
        Provider.of<ThemeColorProvider>(context, listen: false)
            .getPrimaryColors();
    final List<ThemeColor> _accentColors =
    Provider.of<ThemeColorProvider>(context, listen: false)
        .getAccentColors();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _primaryColors.length,
        itemBuilder: (context, index) {
          return ButtonTheme(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minWidth: 0,
            padding: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.all(15),
              child: FlatButton(
                onPressed: () {
                  Provider.of<ThemeColorProvider>(context, listen: false)
                      .updatePrimaryColor(_primaryColors[index].color);
                  Provider.of<ThemeColorProvider>(context, listen: false)
                      .updateAccentColor(_accentColors[index].color);
                },
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: _primaryColors[index].color,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(_primaryColors[index].title),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
