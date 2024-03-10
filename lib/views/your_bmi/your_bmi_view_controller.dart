import 'package:get/get.dart';
import 'package:vegleges_wo/models/account.dart';
import 'package:vegleges_wo/views/calculate_bmi/calculate_bmi_view.dart';
import 'package:vegleges_wo/views/profile_details/profile_details_view.dart';

class YourBMIViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;

  String myBmiNum() {
    //return (180 / 80).toString(); //teszt
    return (account.height / account.weight).toString();
  }

  void openTheProfileDetailsView() {
    Get.to(
      ProfileDetailsView(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
  }

  void getToCalculateBMIView(){
    Get.to(BMICalculator(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
  }
}
