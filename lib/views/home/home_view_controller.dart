import 'package:get/get.dart';
import 'package:vegleges_wo/models/account.dart';
import 'package:vegleges_wo/views/activites/activities_view.dart';
import 'package:vegleges_wo/views/your_bmi/your_bmi_view.dart';

class HomeViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  

  void goToBmi() {
    Get.to(
      () => YourBMIView(),
      transition: Transition.cupertinoDialog,
      arguments: {"account": account},
    );
  }

  void goToActivities(){
    Get.to(
      () => ActivitiesView(),
      transition: Transition.cupertino,
      arguments: {"account": account}
    );
  }
}
