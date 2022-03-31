import 'package:get/get.dart';
import 'package:invis_project/api_service/fetch_data.dart';
import 'package:invis_project/data_model/data_model.dart';
import 'package:invis_project/logic/helper_functions.dart';

enum ServerRes { failed, get, load, locationDataFail }

class DataController extends GetxController {
  var dataModel = <DataModel>[].obs;

  var getDataStatus = ServerRes.load.obs;
  var singleData = DataModel().obs;
  //permanently sore data
  late List<DataModel> storeData;
//get data on details page
  void getSingleData(int id) {
    singleData.value = dataModel[id];
  }

//According to the user distance
  filterDataByKm(double? km) {
    var data = HelperFunction.filterByKilometer(dataModel, kilometer: km);
    if (data != null) {
      dataModel.value = data;
    }
  }

  @override
  void onInit() async {
    //fetch data from api
    var dataModelList = await ApiService.fetchData();

    if (dataModelList != null && dataModelList.isNotEmpty) {
      // insert distance in to got data
      List<DataModel>? data =
          await HelperFunction.insertDistanceInModel(dataModelList);
      if (data != null) {
        //filter by kilometers
        List<DataModel>? datas = HelperFunction.filterByKilometer(
          data,
        );
        if (datas != null && datas.isNotEmpty) {
          dataModel.value = datas;
          storeData = datas;
          getDataStatus.value = ServerRes.get;
        } else {
          //According to the user distance if data is not available
          getDataStatus.value = ServerRes.locationDataFail;
        }
      } else {
        //not get data from Api
        getDataStatus.value = ServerRes.failed;
      }
    } else {
      //not get data from Api
      getDataStatus.value = ServerRes.failed;
    }
    super.onInit();
  }
}
