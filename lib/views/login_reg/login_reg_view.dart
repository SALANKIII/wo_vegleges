import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/components%20copy/custom_text_field.dart';
import 'package:vegleges_wo/views/login_reg/login_reg_view_controller.dart';

class LogRegView extends StatelessWidget {
  const LogRegView({super.key});

  @override
  Widget build(BuildContext context) {
    LogRegViewController controller = Get.put(LogRegViewController());
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        var _ = DefaultTabController.of(context);
        _.animation!.addListener(() {
          controller.site = (_.indexIsChanging) ? _.index : _.animation!.value.round();
        });
        return GetBuilder<LogRegViewController>(
            init: controller,
            builder: (_) {
              return Scaffold(
                backgroundColor: Colors.black,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.navigate_next_sharp, color: Colors.white),
                  onPressed: () => controller.buttonClickEvent(),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabAlignment: TabAlignment.center,
                        tabs: [
                          Tab(
                            child: Text("Login", style: TextStyle(fontSize: 20)),
                          ),
                          Tab(
                            child: Text("Registration", style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.loginEmailController,
                                prefixIcon: Icon(Icons.mail, size: 18),
                                labelText: "Email",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: controller.loginPasswordController,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.regEmailController,
                                prefixIcon: Icon(Icons.mail, size: 18),
                                labelText: "Email",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: controller.regPwdController,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                              CustomTextField(
                                controller: controller.regPwd2Controller,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password again",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                              CustomTextField(
                                controller: controller.regUsernameController,
                                prefixIcon: Icon(Icons.person, size: 18),
                                labelText: "Username",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
