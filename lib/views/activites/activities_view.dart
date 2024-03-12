import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/views/activites/activities_view_controller.dart';

class ActivitiesView extends StatelessWidget {
  AllExerciseViewController controller = Get.put(AllExerciseViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllExerciseViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Activities"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Column(),
        );
      }
    );
  }
}
