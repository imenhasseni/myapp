import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/home/controllers/home_controller.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () =>  Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Choose your favorite fashion categories",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("You can choose more than one",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[800],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ResponsiveGridCol(
                    child: ResponsiveGridRow(
                      children: [
                        for (int index = 0;
                            index < controller.listGategory.length;
                            index++)
                          ResponsiveGridCol(
                            xs: 6,
                            child: Obx(() => InkWell(
                                  onTap: () {
                                    // ignore: invalid_use_of_protected_member
                                    controller.listGategory.value[index]
                                            .selected =
                                        !controller
                                            // ignore: invalid_use_of_protected_member
                                            .listGategory.value[index].selected;
                                    // ignore: invalid_use_of_protected_member
                                    controller.listGategory.value = [
                                      // ignore: invalid_use_of_protected_member
                                      ...controller.listGategory.value
                                    ];
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 15,
                                          right: 15),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: controller.listGategory
                                                  // ignore: invalid_use_of_protected_member
                                                  .value[index].selected
                                              ? Colors.red[400].withOpacity(0.7)
                                              : Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40.0)),
                                          border: Border.all(
                                            color: controller.listGategory
                                                    // ignore: invalid_use_of_protected_member
                                                    .value[index].selected
                                                ? Colors.white
                                                : Colors.grey[300],
                                          ),
                                        ),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  controller.listGategory
                                                      // ignore: invalid_use_of_protected_member
                                                      .value[index].image,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  controller.listGategory
                                                      // ignore: invalid_use_of_protected_member
                                                      .value[index].name,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      fontSize: 14,
                                                      letterSpacing: 0.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: controller
                                                              .listGategory
                                                              // ignore: invalid_use_of_protected_member
                                                              .value[index]
                                                              .selected
                                                          ? Colors.white
                                                          : Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      )),
                                )),
                          )
                      ],
                    ),
                  ),
                
                    Padding(
                      padding: const EdgeInsets.only(left: 20,  right: 20, bottom: 70,top: 10 ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          child: const Text(
                            "Continue",
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
                          onPressed: controller.navigateToProduct,
                        ),
                      ),
                    ),   
                  ],
                ),
    ));
  }
}
