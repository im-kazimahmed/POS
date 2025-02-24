import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:pos/model/store.dart';

class LocalDataHelper {
  var box = GetStorage();

  // Save Store Id in local storage
  Future<void> saveStoreId(int storeId) async {
    await box.write('storeId', storeId);
  }

  // Get Store Id from local storage
  int? getStoreId() {
    int? getData = box.read("storeId");
    return getData;
  }

  // Save Store in local storage
  saveStoreData(Store store) async {
    await box.write('storeDetails', store.toJson());
  }

  // getStoreData(Store store) async {
  //   await box.read('storeDetails');
  // }

  // Get Store from local storage
  Store? getStoreData() {
    var storeDataModel = box.read('storeDetails');
    return storeDataModel?.fromJson(storeDataModel);
  }

}
