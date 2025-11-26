import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabe_bank_application/controllers/ocr_controller.dart';

class OCRScannerScreen extends StatelessWidget {
  OCRScannerScreen({super.key});

  final OCRScannerController controller = Get.put(OCRScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OCR Scanner")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Show CCCD info
            Obx(() {
              if (controller.ocrResult.value == null) return Container();
              final info = controller.ocrResult.value!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('THÔNG TIN'),
                  Text('Họ và tên: ${info.data.name}'),
                  Text('Ngày sinh: ${info.data.dob}'),
                  Text('Giới tính: ${info.data.sex}'),
                  Text('Thường trú: ${info.data.address}'),
                  Text('Nguyên quán: ${info.data.home}'),
                  Text('Quốc tịch: ${info.data.nationality}'),
                  Text('Ngày hết hạn: ${info.data.doe}'),
                ],
              );
            }),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                  label: const Text("Gallery"),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () => controller.pickImage(ImageSource.camera),
                  label: const Text("Camera"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
