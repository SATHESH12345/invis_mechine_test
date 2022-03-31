import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invis_project/logic/data_controller.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);
  final DataController dataCtr = Get.find();
  final Widget space = const SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details...")),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/hotelimage.jpg"),
                fit: BoxFit.cover,
              ))),
          Card(
            elevation: 10,
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/hotelimage.jpg"),
                      fit: BoxFit.cover,
                    ))),
                //name
              ],
            ),
          ),
          Positioned(
            top: 180,
            bottom: 0,
            right: 10,
            left: 10,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeText(
                          text: "${dataCtr.singleData.value.name}",
                          fontSize: 18,
                        ),
                        space,
                        CustomeText(
                          text: "${dataCtr.singleData.value.address1}",
                        ),
                        CustomeText(
                          text: "${dataCtr.singleData.value.address2}",
                        ),
                        CustomeText(
                          text: "${dataCtr.singleData.value.place}",
                        ),
                        space,
                        CustomeText(
                          text: "Pin Code -${dataCtr.singleData.value.pincode}",
                        ),
                        space,
                        Row(
                          children: [
                            const Icon(Icons.phone_android),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomeText(
                              text:
                                  "${dataCtr.singleData.value.countryCode} ${dataCtr.singleData.value.mobile}",
                              fontSize: 15,
                            ),
                          ],
                        ),
                        space,
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomeText(
                              text:
                                  "${dataCtr.singleData.value.stdCode}- ${dataCtr.singleData.value.telephone1}",
                            ),
                          ],
                        ),
                        space,
                        Row(
                          children: [
                            const Icon(Icons.email),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomeText(
                              text: "${dataCtr.singleData.value.commEmail}",
                            ),
                          ],
                        ),
                        space,
                        Row(
                          children: [
                            const Icon(Icons.web),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomeText(
                              text: "${dataCtr.singleData.value.website}",
                            ),
                          ],
                        ),
                        space,
                        CustomeText(
                          text:
                              "Distance from You : ${dataCtr.singleData.value.distance} KM",
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class CustomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomeText({Key? key, required this.text, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: Colors.black54),
      ),
    );
  }
}
