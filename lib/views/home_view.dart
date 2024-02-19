import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/controllers/home_view_controller.dart';
import 'package:vegleges_wo/views/your_bmi_view.dart';

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
              children: <Widget>[
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(YourBMIView());
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('images/profile_picture.jpg'),
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Good to see you",
                          style: TextStyle(color: Colors.white54),
                        ),
                        Text(
                          "John Smith",
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
                        style: TextStyle(
                            color: Color.fromRGBO(65, 221, 41, 1), fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TabBar(
                    indicatorColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabAlignment: TabAlignment.center,
                    tabs: [
                      Tab(
                        child: Text("Legs",
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Tab(
                        child: Text("Chest",
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
