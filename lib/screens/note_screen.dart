
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  SharedPreferences _prefs;
  String _note;
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _fetchNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              _note ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Change your note',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _prefs.setString(kNote, _textEditingController.text);
                    setState(() {
                      _note = _prefs.getString(kNote);
                    });
                  },
                  child: Text(
                    'Confirm',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchNote() async {
    _prefs = await SharedPreferences.getInstance();
    _note = _prefs.getString(kNote);
  }
}
