// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:io';

import '../widgets/drawer.dart';
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  //function to dispose controllers at the end
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final Map<String, String?> data = {};
  myPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data["name"] = prefs.getString('Full Name');
      data["email"] = prefs.getString('Email');
      data["phoneNumber"] = prefs.getString('PhoneNumber');
      data["status"] = prefs.getString('Status');
      data["id"] = prefs.getString('Id');
    });
  }

  @override
  void initState() {
    myPrefs();
    super.initState();
  }

  var itemPic = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(data: data),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Add Item"),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //name text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Item\'s Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name of item';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Description textfeild
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Item\'s Description',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter description of item';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      shadowColor: Colors.grey,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                "Upload Photo",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      margin:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () async {
                          //checking all fields are filled..if true then calling a function form provider named addItem
                          // if (_formKey.currentState!.validate()) {
                          //   if (itemPic != "") {
                          //     Provider.of<ItemNotifer>(context, listen: false)
                          //         .addItemWithImage(
                          //             _nameController.text,
                          //             data["id"],
                          //             _descriptionController.text,
                          //             itemPic,
                          //             context);
                          //   } else {
                          //     Provider.of<ItemNotifer>(context, listen: false)
                          //         .addItemWithOutImage(
                          //             _nameController.text,
                          //             data["id"],
                          //             _descriptionController.text,
                          //             context);
                          //   }
                          //   _nameController.text = '';
                          //   _descriptionController.text = '';
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text('Empty Fields Found')),
                          //   );
                          // }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Add Item",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
