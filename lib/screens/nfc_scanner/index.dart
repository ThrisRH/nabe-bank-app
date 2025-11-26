import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCController extends GetxController {
  var isAvailable = false.obs;
  var nfcData = "".obs;
  var isScanning = false.obs;

  Future<void> checkAvailability() async {
    isAvailable.value = await NfcManager.instance.isAvailable();
  }

  void startScan() {
    if (!isAvailable.value) {
      nfcData.value = "Thiết bị không hỗ trợ NFC";
      return;
    }

    isScanning.value = true;
    nfcData.value = "Đang quét...";

    NfcManager.instance.startSession(
      pollingOptions: {NfcPollingOption.iso14443},
      onDiscovered: (tag) async {
        // ignore: invalid_use_of_protected_member
        nfcData.value = tag.data.toString();

        stopScan();
      },
    );
  }

  void stopScan() {
    NfcManager.instance.stopSession();
    isScanning.value = false;
  }
}

class NFCPage extends StatelessWidget {
  NFCPage({super.key});
  final nfc = Get.put(NFCController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Flutter')),

      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nfc.nfcData.value),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: nfc.isScanning.value ? null : nfc.startScan,
                child: Text("Quét NFC"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
