import 'package:flutter/material.dart';
import 'package:learn_dio_service/models/deleted_user_model.dart';
import 'package:learn_dio_service/pages/user_info.dart';
import 'package:learn_dio_service/services/network_service.dart';
import '../models/user_model.dart';
import '../models/user_model.dart' as user;

// class Geo {
//   late final String lat;
//   late  final String lng;
//   Geo({required this.lat, required this.lng});
// }
// class Address {
//   late final String street ;
//   late  final String suite;
//   late  final String city;
//   late final String zipcode;
//   late final Geo geo;
//   Address({
//     required this.street,
//     required this.suite,
//     required this.city,
//     required this.zipcode,
//     required this.geo,
//   });
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  late List<UserModel> userList;
  late DeletedUser deletedUser;

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateUserNameController = TextEditingController();
  TextEditingController updatePhoneController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();

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

  void showDialogue([UserModel? userModel]) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Adding new Product"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                  controller: nameController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  controller: userNameController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Phone number",
                  ),
                  controller: phoneController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  controller: emailController,
                ),
              ],
            ),
            actions: [
              MaterialButton(
                  onPressed: () async{
                    if(nameController.text.length > 2 && userNameController.text.length > 2 && phoneController.text.isNotEmpty && emailController.text.length > 5){
                      Navigator.pop(context);
                      UserModel userModel = UserModel(
                          id: "id",
                          name: nameController.text.trim(),
                          username: userNameController.text.trim(),
                          email: emailController.text.trim(),
                          address: user.Address(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: user.Geo(lat: "lat", lng: "lng")),
                          phone: phoneController.text.trim(),
                          website: "website",
                          company: user.Company(name: "name", catchPhrase: "catchPhrase", bs: "bs"),
                      );
                      await NetworkService.POST(NetworkService.apiGetAllUser, userModel.toJson());
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill all gaps"),
                        backgroundColor: Colors.red,
                      ),
                      );
                    }
                    await getData();
                    setState(() {});
                  },
                child: const Text('Save'),
              )
            ],
          );
        }
    );
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
                onLongPress: (){
                  // var item = userList[index];
                  updateNameController.text = item.name;
                  updateUserNameController.text = item.username;
                  updatePhoneController.text = item.phone;
                  updateEmailController.text = item.email;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Updating the product"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: updateNameController,
                              ),
                              TextField(
                                controller: updateUserNameController,
                              ),
                              TextField(
                                controller: updatePhoneController,
                              ),
                              TextField(
                                controller: updateEmailController,
                              ),
                            ],
                          ),
                          actions: [
                            MaterialButton(
                                onPressed: () async{
                                  if(updateNameController.text.length > 2 && updateUserNameController.text.length > 3 && updatePhoneController.text.isNotEmpty && updateEmailController.text.length > 3 )
                                    {
                                      Navigator.pop(context);
                                      UserModel userModel = UserModel(
                                          id: "id",
                                          name: updateNameController.text,
                                          username: updateUserNameController.text,
                                          email: updateEmailController.text,
                                          address: user.Address(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: user.Geo(lat: "lat", lng: "lng")),
                                          phone: updatePhoneController.text,
                                          website: "website",
                                          company: user.Company(name: "name", catchPhrase: "catchPhrase", bs: "bs"),
                                      );
                                      await NetworkService.PUT(NetworkService.apiUpdateUser, userModel.toJson(), item.id);
                                    }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text("Please fill all gaps"),
                                      backgroundColor: Colors.red,
                                    ),
                                    );
                                  }
                                  await getData();
                                  setState(() {});
                                },
                              child: const Text("Save"),
                            ),
                          ],
                        );
                      }
                  );
                },
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

      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogue(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
