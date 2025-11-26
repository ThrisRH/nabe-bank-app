import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/input/icon_input.dart';
import 'package:nabe_bank_application/core/widgets/common/input/normal_input.dart';

class TransferController extends GetxController {
  final scrollOffset = 0.0.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      scrollOffset.value = (scrollController.offset / 100).clamp(0, 1);
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class TransferInfoScreen extends StatelessWidget {
  TransferInfoScreen({super.key});

  final TransferController controller = Get.put(TransferController());

  @override
  Widget build(BuildContext context) {
    final idCardController = TextEditingController();
    final messageController = TextEditingController(
      text: "TRAN HUU MINH TRI chuyen tien",
    );
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
                colors: <Color>[
                  Color(0xFFFFFFFF).withValues(alpha: 0.82),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
            child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  kToolbarHeight + 48,
                  24,
                  24,
                ),
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
                        IconInput(
                          label: "Chọn ngân hàng",
                          hint: "Chọn ngân hàng nhận tiền",
                          icon: GestureDetector(
                            child: SvgPicture.asset(
                              "lib/assets/svg/bank-building.svg",
                            ),
                          ),
                        ),
                        NormalInput(
                          controller: idCardController,
                          label: "Tài khoản / số thẻ",
                          hint: "Nhập số tài khoản / số thẻ người nhận",
                        ),
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
                          label: "Số tiền (VND)",
                          hint: "Nhập số tiền",
                          icon: SvgPicture.asset(
                            "lib/assets/svg/vnd-circle.svg",
                            width: 16,
                            height: 16,
                          ),
                        ),
                        NormalInput(
                          controller: messageController,
                          label: "Nội dung chuyển khoản",
                          hint: "Nhập nội dung",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Obx(() {
            return Container(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
              color: Colors.white.withValues(
                alpha: controller.scrollOffset.value,
              ),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                  Text(
                    "Chuyển tiền",
                    style: context.typography.h4.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
