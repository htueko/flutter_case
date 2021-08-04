import 'package:flutter/material.dart';
import 'package:flutter_case/common/route/app_route.dart';
import 'package:flutter_case/feature/get_countries/controller/get_countries_controller.dart';
import 'package:flutter_case/feature/get_countries/controller/network_controller.dart';
import 'package:get/get.dart';

class GetCountriesView extends StatelessWidget {
  final connectivity = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Countries'),
          centerTitle: true,
        ),
        body: Obx(() {
          return connectivity.status.value == 0
              ? Center(
                  child: Text('Please check your network connectivity'),
                )
              : GetX<GetCountriesController>(
                  builder: (controller) {
                    if (controller.isLoading.isTrue) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: ListView.separated(
                        controller: controller.scrollController,
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.countries.length,
                        itemBuilder: ((context, index) {
                          if (index == controller.countries.length - 1) {
                            // reached at the end of the screen
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              controller
                                  .updateCountry(controller.countries[index]);
                            },
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.blueAccent)),
                                child: Center(
                                    child:
                                        Text(controller.countries[index].code)),
                              ),
                              trailing: controller.countries[index].isFavourite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.blueAccent,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.blueAccent,
                                    ),
                              title: Text(controller.countries[index].name),
                              subtitle:
                                  Text(controller.countries[index].region),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                );
        }),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.flag,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.countriesRoute);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.favouriteRoute);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
