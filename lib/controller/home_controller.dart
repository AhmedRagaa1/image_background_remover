import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController
{
    File imageBefore ;
   Uint8List imageAfter;
  final picker = ImagePicker();

  Future getImageFromGallery() async
  {
     PickedFile pickedFile = await picker.getImage(
         source: ImageSource.gallery,

     );
     imageBefore = File(pickedFile.path);
     update();
  }


  void uploadImage(File file) async
  {
    String fileName = file.path.split("/").last;
    FormData data = FormData.fromMap({
      "source_image_file":await MultipartFile.fromFile(
        file.path ,
        filename: fileName,
      )
    });

    Dio dio =Dio();
   var response = await dio.post(
        "https://api.slazzer.com/v2.0/remove_image_background",
      data: data,
      options: Options(
        headers:
        {
          "API-KEY":"08495c521ea44797beaf1dfa32d91d17",
        },
        responseType: ResponseType.bytes,
      ));
   imageAfter = response.data;
   update();
  }


}

