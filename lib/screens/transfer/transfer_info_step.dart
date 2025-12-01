import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/utils/money_formatter.dart';
import 'package:nabe_bank_application/core/widgets/common/button/normal_button.dart';
import 'package:nabe_bank_application/core/widgets/common/input/icon_input.dart';
import 'package:nabe_bank_application/core/widgets/common/input/normal_input.dart';
import 'package:nabe_bank_application/core/widgets/layout/sub_screen/index.dart';
import 'package:nabe_bank_application/screens/transfer/widgets/select_bank.dart';

class TransferController extends GetxController {
  final selectedBank = "".obs;
  final idCard = "".obs;
  final amount = "".obs;
  final message = "TRAN HUU MINH TRI chuyen tien".obs;

  final selectedBankController = TextEditingController();
  final idCardController = TextEditingController();
  final amountController = TextEditingController();
  final messageController = TextEditingController(
    text: "TRAN HUU MINH TRI chuyen tien",
  );

  bool get isDisabled =>
      selectedBank.value.isEmpty ||
      idCard.value.isEmpty ||
      amount.value.isEmpty ||
      message.value.isEmpty;

  @override
  void onInit() {
    super.onInit();
    idCardController.addListener(() => idCard.value = idCardController.text);
    amountController.addListener(() => amount.value = amountController.text);
    messageController.addListener(() => message.value = messageController.text);
    selectedBankController.addListener(
      () => selectedBank.value = selectedBankController.text,
    );
  }

  @override
  void onClose() {
    selectedBankController.dispose();
    idCardController.dispose();
    amountController.dispose();
    messageController.dispose();
    super.onClose();
  }

  // Hàm mở bottom sheet chọn ngân hàng
  Future<void> openSelectBank() async {
    final bank = await Get.bottomSheet(
      const SelectBankPopup(),
      isScrollControlled: true,
    );

    if (bank != null && bank is String) {
      selectedBankController.text = bank;
      selectedBank.value = bank;
    }
  }
}

class TransferInfoScreen extends StatelessWidget {
  TransferInfoScreen({super.key});

  final TransferController transferController = Get.put(TransferController());
  final ScrollAppBarController scrollController =
      Get.find<ScrollAppBarController>();

  @override
  Widget build(BuildContext context) {
    return SubScreenLayout(
      title: "Chuyển tiền",
      child: SingleChildScrollView(
        controller: scrollController.scrollController,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, kToolbarHeight + 48, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 12,
                  top: 12,
                  bottom: 12,
                ),
                height: 103,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1, color: AppColors.darkBlue),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB8D6FF),
                      spreadRadius: -9,
                      blurRadius: 16,
                      offset: Offset(0, 12),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFFDFDFF), Color(0xFFECF3FF)],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tổng số dư",
                            style: context.typography.body4.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                          Text(
                            "50.000 VND",
                            style: context.typography.body1.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Số tài khoản: 0389105492",
                            style: context.typography.body4.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: RotatedBox(
                        quarterTurns: 135,
                        child: Icon(
                          size: 16,
                          Icons.arrow_back_ios_new,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Thông tin người nhận
              Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thông tin người nhận",
                    style: context.typography.h4.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                  InkWell(
                    onTap: transferController.openSelectBank,
                    child: AbsorbPointer(
                      child: IconInput(
                        keyboardType: TextInputType.text,
                        controller: transferController.selectedBankController,
                        onChanged:
                            (v) => transferController.selectedBank.value = v,
                        readOnly: true,
                        label: "Chọn ngân hàng",
                        hint: "Chọn ngân hàng nhận tiền",
                        icon: SvgPicture.asset(
                          "lib/assets/svg/bank-building.svg",
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    return NormalInput(
                      onChanged: (v) => transferController.idCard.value = v,
                      isDisabled: transferController.selectedBank.isEmpty,
                      controller: transferController.idCardController,
                      label: "Tài khoản / số thẻ",
                      hint: "Nhập số tài khoản / số thẻ người nhận",
                    );
                  }),
                ],
              ),

              // Thông tin giao dịch
              Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thông tin giao dịch",
                    style: context.typography.h4.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                  IconInput(
                    keyboardType: TextInputType.number,
                    inputFormatters: [MoneyInputFormatter()],
                    controller: transferController.amountController,
                    onChanged: (v) => transferController.amount.value = v,
                    label: "Số tiền (VND)",
                    hint: "Nhập số tiền",
                    icon: SvgPicture.asset(
                      "lib/assets/svg/vnd-circle.svg",
                      width: 16,
                      height: 16,
                    ),
                  ),
                  NormalInput(
                    onChanged: (v) => transferController.message.value = v,
                    controller: transferController.messageController,
                    label: "Nội dung chuyển khoản",
                    hint: "Nhập nội dung",
                  ),
                ],
              ),

              Obx(() {
                final isDisabled = transferController.isDisabled;
                return NormalButton(
                  onTap: () {
                    Get.toNamed("/transfer/overview");
                  },
                  label: "Tiếp tục",
                  isDisable: isDisabled,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
