import 'package:flutter/material.dart';
import 'package:flutter_case/feature/get_favourites/controller/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
          centerTitle: true,
        ),
        body: GetX<FavouriteController>(
          builder: (controller) {
            if (controller.countries.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732386__340.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text('There is nothing to show, except my cute smile'),
                  )
                ],
              );
            } else {
              return Container(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.countries.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.blueAccent)),
                        child: Center(
                            child: Text(controller.countries[index].code)),
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
                      subtitle: Text(controller.countries[index].region),
                    );
                  }),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
