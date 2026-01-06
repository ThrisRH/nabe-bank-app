import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/button/normal_button.dart';
import 'package:nabe_bank_application/core/widgets/layout/sub_screen/index.dart';
import 'package:nabe_bank_application/screens/transfer/steps/step_1.dart';
import 'package:nabe_bank_application/screens/transfer/widgets/info_box.dart';

class TransferOverviewScreen extends StatelessWidget {
  TransferOverviewScreen({super.key});

  final transferController = Get.find<TransferController>();
  final ScrollAppBarController scrollController =
      Get.find<ScrollAppBarController>();

  @override
  Widget build(BuildContext context) {
    return SubScreenLayout(
      title: "Thông tin chuyển khoản",
      onBack: () => Get.back(),
      action: NormalButton(
        onTap: () {
          Get.toNamed("/transfer/result");
        },
        label: "Tiếp tục",
        isDisable: false,
      ),
      child: Column(
        spacing: 24,
        children: [
          Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderMoreOpacity, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  "Hóa đơn chuyển khoản",
                  style: context.typography.body1.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Divider(color: AppColors.darkBlue),
                InfoField(
                  nameOfField: "Tài khoản nhận",
                  contentOfField: transferController.idCard.value,
                  status: InfoStatus.normal,
                ),
                InfoField(
                  nameOfField: "Họ tên người nhận",
                  contentOfField: "NGUYEN DO RAN",
                  status: InfoStatus.important,
                ),
                InfoField(
                  nameOfField: "Ngân hàng người nhận",
                  contentOfField: transferController.selectedBank.value,
                  status: InfoStatus.normal,
                ),
                InfoField(
                  nameOfField: "Nội dung",
                  contentOfField: transferController.message.value,
                  status: InfoStatus.normal,
                ),
                InfoField(
                  nameOfField: "Số tiền",
                  contentOfField: "${transferController.amount.value} VND",
                  status: InfoStatus.important,
                ),
              ],
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.circle, size: 8, color: AppColors.darkBlue),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: context.typography.body3.copyWith(
                      color: AppColors.darkBlue,
                    ),
                    children: [
                      const TextSpan(text: "Vui lòng"),
                      TextSpan(
                        text: " kiểm tra thông tin ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(text: "chuyển khoảng trước khi"),
                      TextSpan(
                        text: " xác nhận ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(text: "giao dịch."),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
