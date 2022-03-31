import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invis_project/data_model/data_model.dart';
import 'package:invis_project/details_page.dart/details_page.dart';
import 'package:invis_project/details_page.dart/search_input.dart';
import 'package:invis_project/logic/data_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final DataController dataCtr = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Near By you"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchInput(),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            if (dataCtr.getDataStatus.value == ServerRes.load) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (dataCtr.getDataStatus.value == ServerRes.failed) {
              return const Expanded(
                  child: Center(
                child: Text("Failed to load data"),
              ));
            } else if (dataCtr.getDataStatus.value ==
                ServerRes.locationDataFail) {
              return const Expanded(
                  child: Center(
                child: Text("No any Data Match your location"),
              ));
            }
            return Expanded(
              child: ListView.separated(
                itemCount: (dataCtr.dataModel.length),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 5),
                itemBuilder: (BuildContext context, int index) {
                  DataModel? data = dataCtr.dataModel[index];
                  return ListTileHome(
                    name: "${data.name}",
                    ditance: data.distance,
                    place: data.place!,
                    onTap: () {
                      dataCtr.getSingleData(index);

                      Get.to(() => DetailsPage());
                    },
                  );
                },
              ),
            );
          }),
        ],
      )),
    );
  }
}

class ListTileHome extends StatelessWidget {
  final String name;
  final String? place;
  final double? ditance;
  final Function() onTap;
  const ListTileHome(
      {Key? key,
      required this.name,
      this.ditance = 0,
      required this.place,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          minVerticalPadding: 5,
          tileColor: Colors.blue[50],
          leading: const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/images/hotel.jpg"),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            name,
            textScaleFactor: 1,
          ),
          trailing: const Icon(Icons.arrow_right),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(place!), Text("Distance:$ditance KM")],
          ),
          onTap: onTap),
    );
  }
}
