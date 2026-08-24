import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
}
