import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/button/border_button.dart';
import 'package:nabe_bank_application/core/widgets/common/button/normal_button.dart';
import 'package:nabe_bank_application/core/widgets/layout/sub_screen/index.dart';
import 'package:nabe_bank_application/screens/home/widgets/item_box.dart';
import 'package:nabe_bank_application/screens/transfer/steps/step_1.dart';
import 'package:nabe_bank_application/screens/transfer/widgets/info_box.dart';

class TransferResultScreen extends StatelessWidget {
  TransferResultScreen({super.key});

  final transferController = Get.find<TransferController>();
  final ScrollAppBarController scrollController =
      Get.find<ScrollAppBarController>();

  @override
  Widget build(BuildContext context) {
    return SubScreenLayout(
      title: "Kết quả giao dịch",
      onBack: () => Get.offAndToNamed("/"),
      action: Row(
        spacing: 12,
        children: [
          Flexible(
            flex: 1,
            child: BorderButton(
              onTap: () {
                Get.offAllNamed("/home");
              },
              label: "Hoàn tất",
              isDisable: false,
            ),
          ),

          Flexible(
            flex: 2,
            child: NormalButton(
              onTap: () {
                Get.offAllNamed("/transfer");
              },
              label: "Tạo giao dịch mới",
              isDisable: false,
            ),
          ),
        ],
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
              spacing: 12,
              children: [
                SvgPicture.asset(
                  "lib/assets/svg/status/success-circle.svg",
                  colorFilter: ColorFilter.mode(
                    AppColors.success,
                    BlendMode.srcIn,
                  ),
                  width: 42,
                  height: 42,
                ),
                Text(
                  "Giao dịch thành công",
                  style: context.typography.h4.copyWith(color: AppColors.black),
                ),
                Text(
                  "${transferController.amount.value} VND",
                  style: context.typography.h2.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "09:49 - 18/08/2025",
                  style: context.typography.body4.copyWith(
                    color: AppColors.darkBlue,
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
                  nameOfField: "Trạng thái",
                  contentOfField: "Thành công",
                  status: InfoStatus.success,
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              ItemBox(
                label: "Lưu ảnh",
                svgPath: "lib/assets/svg/qr-scan.svg",
                isBackground: false,
                onTap: () {},
              ),
              ItemBox(
                label: "Lưu thụ hưởng",
                svgPath: "lib/assets/svg/face-id.svg",
                isBackground: false,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
