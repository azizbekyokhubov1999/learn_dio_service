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
        title: const Text("User information",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black87
        ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const  SizedBox(height: 20),
          Row(
            children: [
            const  Text("Name od the user: ",
           style: TextStyle(
             color: Colors.blue,
             fontSize: 20,
             fontWeight: FontWeight.bold
           ),
           ),
              Text(userModel.name,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const  Text("Username of the user: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(userModel.username,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const  Text("Email of the user: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(userModel.email,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const  Text("Phone number of the user:",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(userModel.phone,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const  Text("Website link of the user: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(userModel.website,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
