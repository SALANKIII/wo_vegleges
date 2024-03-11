import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegleges_wo/backend/backend.dart';
import 'package:vegleges_wo/models/account.dart';
import 'package:vegleges_wo/views/login_reg/login_reg_view.dart';

class ProfileDetailsViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  TextEditingController userNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  DateTime dateTime = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    userNameController.text = account.username;
    dateTime = account.birthDate;
  }

  void sendEditUsernameRequest() async {
    String uzenet = await Backend.PUT(
      route: "/editUsername/${account.email}",
      body: {"username": userNameController.text},
    );
    print(uzenet); // backend válasz kiírása
    account.username = userNameController.text; // aktualizáljuk a lokális adatainkkal
    update(); // képernyő frissítése
    Get.back(); // bottomSheet ablak bezáródjon
  }

  void sendEditDateRequest() async {
    String uzenet = await Backend.PUT(
      route: "/editBirthday/${account.email}",
      body: {"birthday": dateTime.toString().split(' ')[0]},
    );
    print(uzenet);
    // aktualizáljuk a lokális adatainkkal
    account.birthDate = dateTime;
    update();
    Get.back(); // bottomSheet ablak bezáródjon
  }

  void sendEditPwdRequest() async {
    if (pwdController.text == pwd2Controller.text) {
      String uzenet = await Backend.PUT(
        route: "/editPassword/${account.email}",
        body: {"password": pwdController.text},
      );
      print(uzenet);
      Get.back(); // bottomSheet ablak bezáródjon
    }
  }

  void logOut() {
    final box = GetStorage();
    box.remove("email");
    Get.offAll(() => LogRegView(), transition: Transition.cupertino);
  }
}