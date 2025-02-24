// providers/store_provider.dart
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos/data/api_service.dart';
import 'package:pos/data/local_data_helper.dart';
import 'package:pos/model/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreProvider with ChangeNotifier {
  final _storeIdController = TextEditingController();
  final _purchaseCodeController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Store? _store;
  bool _isActivated = false;
  int _activeStep = 0;

  int get activeStep => _activeStep;
  bool get isLoading => _isLoading;
  String? get errorMsg => _errorMessage;
  Store? get store => _store;
  bool get isActivated => _isActivated;
  Function get activate => _activateStore;
  // TextEditingController get storeIdController => _storeIdController;
  TextEditingController get purchaseCodeController => _purchaseCodeController;

  void onStepChange (int step) {
    _activeStep = step;
    notifyListeners();
  }

  // Load store data from local storage on startup
  Future<void> loadStore() async {
    final storeId = LocalDataHelper().getStoreId();
    log("loading store");
    if (storeId != null) {
      log("getting store details $storeId");
      // Fetch store details from backend
      final data = await ApiService.getStoreDetails(storeId);
      if(data['store'] != null) {
        _store = Store.fromJson(data['store']);
      }
      if(_store != null && _store?.status != null) {
        _isActivated = _store!.status;
      } else {
        _errorMessage = data['message'];
        _isActivated = false;
      }
    }
    notifyListeners();
  }

  // Create store with purchase code
  Future<bool> createStore() async {
    _isLoading = true;
    notifyListeners();

    final data = await ApiService.createStore(purchaseCodeController.text);

    if (data != null) {
      log("data $data");
      int storeId = data['store']['id'];
      await LocalDataHelper().saveStoreId(storeId);
      await _fetchStoreDetails(storeId);
      _isLoading = false;
      onStepChange(1);
      notifyListeners();
      return true;
    } else {
      log("data else $data");
      _errorMessage = data['message'];
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> _fetchStoreDetails(int storeId) async {
    _store = await ApiService.getStoreDetails(storeId);

    if (_store != null && _store?.status != null) {
      _isActivated = _store!.status;
      log("Activating store using store status");
    } else {
      _isActivated = false;
      log("Activating store false");
    }
  }
  // // Create store with purchase code
  // Future<bool> createStore() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   final storeId = await ApiService.createStore(purchaseCodeController.text);
  //   if (storeId != null) {
  //     log("saving store id in local storage");
  //     // Save store ID in local storage
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setInt('storeId', storeId);
  //
  //     // Fetch store details
  //     _store = await ApiService.getStoreDetails(storeId);
  //     if(_store != null && _store?.status != null) {
  //       _isActivated = _store!.status;
  //       log("activating store using store_status");
  //     } else {
  //       _isActivated = false;
  //       log("activating store false");
  //     }
  //     _isLoading = false;
  //     notifyListeners();
  //     return true;
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return false;
  // }

  // Activate store with purchase code
  Future<bool> verifyPurchaseCode(int storeId, String purchaseCode) async {
    final isValid = await ApiService.verifyPurchaseCode(storeId, purchaseCode);
    if (isValid) {
      // Save store ID in local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('storeId', storeId);

      // Fetch store details
      _store = await ApiService.getStoreDetails(storeId);
      if(_store != null && _store?.status != null) {
        _isActivated = _store!.status;
      } else {
        _isActivated = false;
      }
      notifyListeners();
      return true;
    }
    return false;
  }


  Future<bool> _activateStore() async {
    _isLoading = true;
    notifyListeners();
    final storeId = int.tryParse(_storeIdController.text);
    final purchaseCode = _purchaseCodeController.text;

    if (storeId != null && purchaseCode.isNotEmpty) {
      final success = await verifyPurchaseCode(storeId, purchaseCode);
      if (success) {
        return true;
      } else {
        _errorMessage = 'Invalid purchase code or store ID.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } else {
      _errorMessage = 'Please enter valid details.';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
