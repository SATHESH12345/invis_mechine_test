import 'package:invis_project/data_model/data_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:invis_project/logic/get_location.dart';

class HelperFunction {
  //data filter by kilometer
  static List<DataModel>? filterByKilometer(List<DataModel> data,
      {double? kilometer}) {
    List<DataModel> getdata = [];
    for (var getDa in data) {
      if (getDa.distance != null) {
        if (kilometer != null) {
          if (getDa.distance! < kilometer) {
            getdata.add(getDa);
          }
        } else {
          getdata.add(getDa);
        }
      }
    }
    return getdata;
  }

// distance insert in to datamodel
  static Future<List<DataModel>?> insertDistanceInModel(
      List<DataModel> dataModelList) async {
    Position? position = await determinePosition();
    if (position != null) {
      List<DataModel> getdata = [];
      for (var dataModel in dataModelList) {
        //found the distance
        double distanceInMeters = Geolocator.distanceBetween(position.latitude,
            position.longitude, dataModel.latitude!, dataModel.longitude!);

        //covert kilometers
        double km = distanceInMeters / 1000;
        //fixed two decimal points
        double? distance = double.tryParse(km.toStringAsFixed(2));
        dataModel.distance = distance;
        getdata.add(dataModel);
      }
      return getdata;
    }
    return null;
  }
}
