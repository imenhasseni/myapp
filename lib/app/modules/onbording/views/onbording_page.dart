import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/onbording/controllers/onbording_controller.dart';

class OnbordingPage extends GetView<OnbordingController> {
  final _controller = OnbordingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onbordingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onbordingPages[index].imageAsset,
                          height: 300),
                      SizedBox(height: 32),
                      Text(_controller.onbordingPages[index].title,
                       style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                            _controller.onbordingPages[index].description,
                            textAlign: TextAlign.center,
                             style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                        child: Row(
                          children: List.generate(
                              _controller.onbordingPages.length,
                              (index) => Obx(() {
                                    return Container(
                                      margin: const EdgeInsets.all(6),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: _controller
                                                    .selectedPageIndex.value ==
                                                index
                                            ? Colors.red[400].withOpacity(0.7)
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  })),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
              height: 60,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400].withOpacity(0.7),
                  elevation: 1,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(
                    _controller.isLastPage ? 'Start' : 'Next', 
                   style: GoogleFonts.montserrat(
                        textStyle:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),);
                }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
