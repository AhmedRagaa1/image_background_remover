
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_background_remover/controller/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slazzer ai app",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            [
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller)=>ElevatedButton(
                  onPressed: ()
                  {
                    controller.getImageFromGallery();
                  },
                  child: Text(
                    'pick image',
                  ),
                ),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: ((controller) => Center(
                  child: controller.imageBefore == null ?
                  Text("please pick Image")
                  : Image.file(controller.imageBefore),
                )
                ),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller)=>ElevatedButton(
                  onPressed: ()
                  {
                    controller.uploadImage(controller.imageBefore);
                  },
                  child: Text(
                    'upload image',
                  ),
                ),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: ((controller) => Center(
                  child: controller.imageBefore == null ?
                  Center(child: CircularProgressIndicator())
                      : Image.memory(controller.imageAfter),
                )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
