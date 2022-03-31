import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invis_project/data_model/data_model.dart';
import 'package:invis_project/logic/data_controller.dart';
import 'package:invis_project/logic/helper_functions.dart';

class SearchInput extends StatelessWidget {
  SearchInput({Key? key}) : super(key: key);
  final DataController dataCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderSide: BorderSide()),
          hintText: 'Search here',
        ),
        onChanged: (value) {
          HelperFunction.searchData(value);
        });
  }
}
