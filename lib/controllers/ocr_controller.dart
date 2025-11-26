import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabe_bank_application/core/models/id_card_model.dart';
import 'package:nabe_bank_application/core/services/ocr_service.dart';

class OCRScannerController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final ocrService = OcrService();

  Rx<OCRResponse?> ocrResult = Rx<OCRResponse?>(null);

  RxBool isLoading = false.obs;

  Future<void> pickImage(ImageSource src) async {
    try {
      final picked = await picker.pickImage(source: src);

      if (picked == null) return;

      isLoading.value = true;

      final File image = File(picked.path);

      final result = await ocrService.scanCitizenIdCard(image);

      ocrResult.value = result;
    } catch (e) {
      ocrResult.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
