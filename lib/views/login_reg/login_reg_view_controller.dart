import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegleges_wo/backend/backend.dart';
import 'package:vegleges_wo/models/account.dart';
import 'package:vegleges_wo/views/home/home_view.dart';

class LogRegViewController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController(text: "admin@admin.hu");
  TextEditingController loginPasswordController = TextEditingController(text: "123456aA");

  // reg
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();

  int site = 0;

  void buttonClickEvent() {
    if (site == 0) {
      login();
    } else {
      reg();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void reg() async {
    print("reg");
    if (regPwdController.text == regPwd2Controller.text) {
      // email, username, gender, weight, height, birthDate, password
      List response = await Backend.POST(route: "/regMobil", body: {
        "email": regEmailController.text,
        "username": regUsernameController.text,
        "password": regPwd2Controller.text,
        "gender": "0",
        "weight": "0",
        "height": "0",
        "birthDate": DateTime.now().toString().split(' ')[0],
      });
      print(response);
      List accounts = response.map((e) => Account.fromJson(e)).toList();
      if (accounts.length != 0) {
        // sikeres reg
        saveMyMail(regEmailController.text);
        Get.offAll(
          () => HomeView(),
          arguments: {"account": accounts[0]},
          transition: Transition.cupertino,
        );
      }
    } else {
      print("nem egyezik meg a jelszó");
    }
  }

  void login() async {
    List response = await Backend.POST(route: "/loginMobile", body: {
      "email": loginEmailController.text,
      "password": loginPasswordController.text,
    });
    List accounts = response.map((e) => Account.fromJson(e)).toList();
    print(accounts);
    print(accounts.length);
    // amikor a length nem 0
    if (accounts.length != 0) {
      // sikeres bejeltkezés
      saveMyMail(loginEmailController.text);
      Get.offAll(
        () => HomeView(),
        arguments: {"account": accounts[0]}, // az első elem a talált felhasználó
        transition: Transition.cupertino,
      );
    }
  }

  // sikeres login/reg után elmenti az email címemet
  void saveMyMail(String mail) {
    final box = GetStorage();
    box.write("email", mail);
  }

  // keresi, hogy van-e lementve email adat
  // kinyeri, hogy van-e olyan felhasználó, aki már
  // egyszer bejelentkezett, de még nem jelentkezett ki
  void loadUser() async {
    final box = GetStorage();
    print("loading account data");
    if (await box.hasData("email")) {
      String mail = await box.read("email");
      loginWithEmail(mail);
    }
  }

  // automatikusan bejelentkeztet egy felhasználót
  void loginWithEmail(String mail) async {
    print("logging with mail");
    List response = await Backend.Get(route: '/getUserMobil/$mail');
    print(response);
    List accounts = response.map((e) => Account.fromJson(e)).toList();
    if (accounts.length != 0) {
      Get.offAll(
        () => HomeView(),
        arguments: {"account": accounts[0]},
        transition: Transition.cupertino,
      );
    }
  }
}
