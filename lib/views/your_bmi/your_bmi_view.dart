import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/views/your_bmi/your_bmi_view_controller.dart';

class YourBMIView extends StatelessWidget {
  YourBMIViewController controller = Get.put(YourBMIViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourBMIViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Your BMI is ${controller.myBmiNum()}"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: controller.openTheProfileDetailsView,
                    icon: Icon(Icons.settings))
              ],
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('images/profile_picture.jpg'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 122, 122, 122))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Üzenet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                          color: Colors.green,
                            child: Text("Calculate new BMI"),
                            onPressed: () {
                              controller.getToCalculateBMIView();
                            }),
              ],
            ),
          );
        });
  }
}
