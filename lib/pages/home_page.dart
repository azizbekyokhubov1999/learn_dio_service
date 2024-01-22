import 'package:flutter/material.dart';
import 'package:learn_dio_service/pages/user_info.dart';
import 'package:learn_dio_service/services/network_service.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<dynamic>? userModel;
  bool isLoading = false;
  Future<void> getData() async{
    userModel = await NetworkService.getWithDio();
    if(userModel != null){
      isLoading = true;
    }
    setState(() {});
}

@override
  void initState() {
    getData();
    super.initState();
  }

  void getInfo(UserModel userModel){
    Navigator.pushNamed(context, UserInfo.id, arguments: userModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      isLoading ?
      ListView.builder(
            itemBuilder: (context, index){
              var item = UserModel.fromJson(userModel![index]);
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                title: Text(item.name ?? "No name"),
                subtitle: Text(item.phone ?? "No phone number"),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                  item.name.isNotEmpty
                  ? item.name[0].toUpperCase()
                  : '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
                onTap: (){
                  getInfo(item);
                },
              );
            },
            itemCount:  userModel?.length ?? 0,
      )
      :const Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }
}
