import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/user_card.dart';
import 'package:flutter_provider_example/screens/random_user_detail_screen.dart';
import 'package:flutter_provider_example/services/networking/random_user/models/random_user_model.dart';
import 'package:flutter_provider_example/services/networking/random_user/providers/random_user_get_provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class RandomUserScreen extends StatefulWidget {
  @override
  _RandomUserScreenState createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RandomUserGetProvider>(context, listen: false)
          .fetchData(userCount: 20);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random user'),
        elevation: 0,
        actions: [
          _buildRefreshAction(onPressed: () {
            Provider.of<RandomUserGetProvider>(context, listen: false)
                .fetchData(userCount: 20);
          }),
        ],
      ),
      body: Consumer<RandomUserGetProvider>(
        builder: (context, provider, _) {
          RandomUserModel randomUserModel =
              Provider.of<RandomUserGetProvider>(context, listen: false)
                  .getModel();
          List<Result> users =
              randomUserModel == null ? [] : randomUserModel.results;

          return ModalProgressHUD(
            inAsyncCall:
                Provider.of<RandomUserGetProvider>(context, listen: false)
                    .isLoading(),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return UserCard(
                  name: '${user.name.first} ${user.name.last}',
                  email: user.email,
                  picture: user.picture.medium,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RandomUserDetailScreen.id,
                      arguments: RandomUserDetailScreenArg(user: user),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRefreshAction({Function onPressed}) {
    return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          onPressed();
        });
  }
}
