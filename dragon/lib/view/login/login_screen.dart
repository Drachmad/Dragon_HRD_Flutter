import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/login_controller.dart';
import 'package:dragon/view/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
        builder: (context, loginController, child) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              Expanded(flex: 5, child: bannerView()),
              Expanded(flex: 5, child: loginView()),
            ],
          ),
        ),
      );
    });
  }

  Widget bannerView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang Di",
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.w600, color: HijauColor),
          ),
          Text(
            "PT. INTIDRAGON SURYATAMA",
            style: GoogleFonts.poppins(
                fontSize: 32, fontWeight: FontWeight.w700, color: HijauColor),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Image.asset("assets/images/banner.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginView() {
    var loginController = Provider.of<LoginController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      child: AspectRatio(
        aspectRatio: 0.9,
        child: Container(
          decoration: BoxDecoration(
              color: kBackgroundColor,
              border: Border.all(color: HijauColor),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: GreyColor,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: const Offset(5, 5),
                ),
              ]),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: HijauColor),
                ),
              ),
              Spacer(),
              Text(
                "Username",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: loginController.usernameLogin,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18, bottom: 18),
                    icon: Image.asset(
                      "assets/images/ic_user_hijau.png",
                      height: 20,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  obscureText: true,
                  controller: loginController.passwordLogin,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18, bottom: 18),
                    icon: Image.asset(
                      "assets/images/ic_password.png",
                      height: 20,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  loginController.getLogin().then((value) {
                    if (value != null) {
                      if (value) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      }
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  decoration: BoxDecoration(
                      color: OrangeColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // InkWell(
              //   onTap: () {
              //     loginController.mode_login = false;
              //     loginController.notifyListeners();
              //   },
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: HijauColor),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Register",
              //         style: GoogleFonts.poppins(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w700,
              //             color: HijauColor),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       showAnimatedDialog_withCallBack(
              //           context, SettingConnection(), isFlip: true,
              //           callback: (value) {
              //         if (value != null) {}
              //       });
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Image.asset(
              //           "assets/images/ic_setting.png",
              //           height: 25,
              //         ),
              //         SizedBox(
              //           width: 8,
              //         ),
              //         Text(
              //           "Database Connection",
              //           style: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.black),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
