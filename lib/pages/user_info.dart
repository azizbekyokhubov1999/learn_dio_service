import 'package:flutter/material.dart';
import 'package:learn_dio_service/models/user_model.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  static const id = '/user_info';

  @override
  Widget build(BuildContext context) {
    UserModel userModel = ModalRoute.of(context)?.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("User infor"),
      ),
    );
  }
}
