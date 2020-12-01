import 'package:flutter/material.dart';
import 'package:flutter_provider_example/services/networking/random_user/models/random_user_model.dart';

class RandomUserDetailScreenArg {
  final Result user;

  RandomUserDetailScreenArg({this.user});
}

class RandomUserDetailScreen extends StatefulWidget {
  static const id = 'random_user_screen';

  @override
  _RandomUserDetailScreenState createState() => _RandomUserDetailScreenState();
}

class _RandomUserDetailScreenState extends State<RandomUserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    RandomUserDetailScreenArg arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Random user detail'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            _buildPicture(arg.user.picture.large),
            Text(
              '${arg.user.name.first} ${arg.user.name.last}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${arg.user.gender}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              '${arg.user.email}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              '${arg.user.phone}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPicture(String picture) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(picture),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
