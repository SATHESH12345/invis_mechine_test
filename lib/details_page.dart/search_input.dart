import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invis_project/data_model/data_model.dart';
import 'package:invis_project/logic/data_controller.dart';

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
        List<DataModel> getdata = [];
        for (var data in dataCtr.storeData) {
          String searchName = value.toLowerCase().trim();
          String name = data.name!.toLowerCase().trim();
          if (searchName != "") {
            if (name.startsWith(searchName)) {
              getdata.add(data);
              dataCtr.dataModel.value = getdata;
            }
          } else {
            dataCtr.dataModel.value = dataCtr.storeData;
          }
        }
      },
    );
  }
}
