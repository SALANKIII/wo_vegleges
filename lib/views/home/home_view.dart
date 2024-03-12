import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/views/home/home_view_controller.dart';

class HomeView extends StatelessWidget {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: controller.goToBmi,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/profile_picture.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good to see you",
                          style: TextStyle(color: Colors.white54),
                        ),
                        Text(
                          "${controller.account.username}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activities",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    CupertinoButton(
                      child: Text(
                        "all >",
                        style: TextStyle(color: Color.fromRGBO(65, 221, 41, 1), fontSize: 20),
                      ),
                      onPressed: () {
                        controller.goToActivities();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 7; i++)
                      Container(
                        width: 40,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int j = 0; j < 10; j++)
                              Container(
                                width: 6,
                                height: 2,
                                color: Colors.white.withOpacity(0.5),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
