import 'package:ecommerce_admin_panel/common/widgets/containers/t_rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:ecommerce_admin_panel/features/media/screens/media/widget/folder_dropdown.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universal_html/html.dart' as html;

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImagesUploaderSection.value
          ? Column(
              children: [
                /// Drag and drop area
                TRoundedContainer(
                  showBorder: true,
                  height: 250,
                  borderColor: TColors.borderPrimary,
                  backgroundColor: TColors.primaryBackground,
                  padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DropzoneView(
                              mime: const ['image/jpeg', 'image/png'],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLoaded: () {
                                print('Zone loading');
                              },
                              onError: (ev) {
                                print('Zone error: $ev');
                              },
                              onHover: () {
                                print('Zone hover');
                              },
                              onLeave: () {
                                print('Zone left');
                              },
                              onCreated: (ctrl) {
                                controller.dropzoneViewController = ctrl;
                              },

                              onDropFile: (file) async {
                                final bytes = await controller
                                    .dropzoneViewController
                                    .getFileData(file);

                                final image = ImageModel(
                                  url: '',
                                  file: file,
                                  folder: '',
                                  filename: file.name,
                                  localImageToDisplay: Uint8List.fromList(
                                    bytes,
                                  ),
                                );
                                controller.selectedImagesToUpload.add(image);
                              },
                              onDropInvalid: (ev) =>
                                  print('Zone invalid MIME: $ev'),
                              onDropMultiple: (ev) =>
                                  print('Zone drop multiply : $ev'),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: TSizes.spaceBtwItems,
                              children: [
                                Icon(Iconsax.gallery, size: 60),
                                Text('Drag and drop Images here.'),
                                OutlinedButton(
                                  onPressed: () {
                                    controller.selectLocalImages();
                                  },
                                  child: Text('Select Images'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                ///heading and Locally Selected Images
                if (controller.selectedImagesToUpload.isNotEmpty)
                  TRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //folder dropdown
                            Row(
                              children: [
                                Text(
                                  'Select Folder',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                MediaFolderDropdown(
                                  onChanged: (MediaCategory? value) {
                                    if (value != null) {
                                      controller.selectedPath.value = value;
                                    }
                                  },
                                ),
                              ],
                            ),

                            //Upload and remove button
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    controller.selectedImagesToUpload.clear();
                                  },
                                  child: Text('Remove All'),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                TDeviceUtils.isMobileScreen(context)
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: TSizes.buttonWidth,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Upload'),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: TSizes.spaceBtwItems / 2,
                          runSpacing: TSizes.spaceBtwItems / 2,
                          children: controller.selectedImagesToUpload
                              .where(
                                (image) => image.localImageToDisplay != null,
                              )
                              .map(
                                (e) => TRoundedImage(
                                  width: 90,
                                  height: 90,
                                  padding: TSizes.sm,
                                  imageType: ImageType.memory,
                                  memoryImage: e.localImageToDisplay,
                                  backgroundColor: TColors.primaryBackground,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
