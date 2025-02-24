// services/api_service.dart
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pos/model/store.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // create store API call
  static Future<dynamic> createStore(String purchaseCode) async {
    log("creating store");
    final response = await http.post(
      Uri.parse('$baseUrl/stores/create'),
      body: {
        'code': purchaseCode,
      },
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    }

    return null;
  }

  // Verify purchase code API call
  static Future<bool> verifyPurchaseCode(int storeId, String purchaseCode) async {
    final response = await http.post(
      Uri.parse('$baseUrl/purchase-code/verify'),
      body: {
        'store_id': storeId.toString(),
        'code': purchaseCode,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // Fetch store details API call
  static Future<dynamic> getStoreDetails(int storeId) async {
    final response = await http.get(Uri.parse('$baseUrl/stores/$storeId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("getting store details response $data");
      return data;
      // if(data['store'] != null) {
      //   return Store.fromJson(data['store']);
      // }
      // return null;
    } else {
      throw Exception('Failed to load store details');
    }
  }

  // static Future<Store> updateSettings() async {
  //   try {
  //     Map<String, dynamic> settings = await fetchSettings();
  //     appName = settings['app_name'] ?? appName;
  //     appLogoUrl = settings['app_logo'] ?? appLogoUrl;
  //     description = settings['description'] ?? description;
  //     primaryColor = settings['primaryColor'] != null
  //         ? Color(int.parse(settings['primaryColor'].replaceFirst('#', '0xff')))
  //         : primaryColor;
  //     secondaryColor = settings['secondaryColor'] != null
  //         ? Color(int.parse(settings['secondaryColor'].replaceFirst('#', '0xff')))
  //         : secondaryColor;
  //     // Update other settings accordingly
  //   } catch (e) {
  //     print('Failed to update settings: $e');
  //   }
  // }
}
