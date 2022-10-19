import 'dart:convert';
import 'package:get/get.dart';
import '../models/items_models.dart';
import 'package:http/http.dart' as http;

class ItemsController extends GetxController {
  var isLoading = false.obs;
  ItemModel? itemsModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://dev.bynail.xyz/test_api/crud_app/view.php')!);
      if (response.statusCode == 200) {
        //data ssuccessfully
        var result = jsonDecode(response.body);
        itemsModel = ItemModel.fromJson(result);
      } else {
        //error
        print('Error fetching data');
      }
    } catch (e) {
      print("Error while getting data is $e");
    } finally {
      isLoading(false);
    }
  }
}
