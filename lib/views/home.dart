import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/items_controller.dart';

class Home extends StatelessWidget {
  ItemsController itemsController = Get.put(ItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch API"),
        ),
        body: Obx(() => itemsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: itemsController.itemsModel?.length ?? 0,
                // itemCount: openseaController.openseaModel?.assets?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        itemsController.itemsModel?[index].name ?? 'no name'),
                    subtitle: Text(itemsController.itemsModel![index].email ??
                        'no description'),
                    leading: itemsController.itemsModel![index].image == null
                        ? Icon(Icons.image)
                        : Image.network(
                            itemsController.itemsModel![index].image!),
                  );
                })));
  }
}
