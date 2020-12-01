import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String picture;
  final Function onTap;

  UserCard({this.name, this.email, this.picture, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            _buildAvatar(picture),
            SizedBox(width: 15,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text('$email'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String picture) {
    return picture == null
        ? CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 40,
          )
        : CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(picture),
            radius: 40,
          );
  }
}
