import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left:50.0, right: 50.0, top: 50.0, bottom: 30.0 ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage: AssetImage('assets/icons/bag.png'),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Login to our store",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.red[400],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/icons/facebook.png",
                        width: 45,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/icons/chrome.png",
                        width: 45,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child:  Divider(
                        color: Colors.grey,
                        height: 50,
                      )),
                ),
                Text(
                  "Or",
                  style: GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child:  Divider(
                        color: Colors.grey,
                        height: 50,
                      )),
                ),
              ]),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Email",
                                style: GoogleFonts.montserrat(
                                  textStyle:  TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: controller.emailController,
                              validator: controller.validatorEmail,
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],
              
                                    )),
                                hintText: "",
                                filled: true,
                                fillColor: Colors.grey[200].withOpacity(0.5),
                              ),
                              cursorColor: Colors.grey,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Password",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                validator: controller.validatorPassword,
                                obscureText: controller.obscureText.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]
                                      )),
                                  enabledBorder:  OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]
                                      )),
                                  focusedBorder:  OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]
                                      )),
                                  filled: true,
                                  fillColor: Colors.grey[200].withOpacity(0.5),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.viewPassWord();
                                    },
                                    icon: controller.obscureText.value
                                        ?  Icon(Icons.visibility_off)
                                        :  Icon(Icons.visibility),
                                    color:  Colors.grey,
                                  ),
                                ),
                                cursorColor:  Colors.grey,
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, right: 10.0, left: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          child:  Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[400].withOpacity(0.7),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: controller.navigateToCategory,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
