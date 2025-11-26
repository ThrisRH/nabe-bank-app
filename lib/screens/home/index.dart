import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/layout/appbar/index.dart';
import 'package:nabe_bank_application/core/widgets/layout/navbar/index.dart';
import 'package:nabe_bank_application/screens/home/widgets/item_box.dart';

class HomeScreen extends GetWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Container(
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -103 / 2,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        spacing: 8,
                        children: [
                          // Ảnh đại diện
                          SizedBox(
                            width: 72,
                            height: 103,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(
                                          0xFFB8D6FF,
                                        ).withValues(alpha: 0.25),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "lib/assets/images/init-avatar.jpeg",
                                      width: 72,
                                      height: 72,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  "lib/assets/svg/arrow-up-double.svg",
                                ),
                              ],
                            ),
                          ),

                          // Thẻ tài khoản
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              height: 103,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
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
                                  colors: <Color>[
                                    Color(0xFFFDFDFF),
                                    Color(0xFFDEE9FF),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tổng số dư",
                                        style: context.typography.body4
                                            .copyWith(
                                              color: AppColors.darkBlue,
                                            ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          // Xử lý dữ liệu
                                        },
                                        child: SvgPicture.asset(
                                          "lib/assets/svg/eye-open.svg",
                                          colorFilter: ColorFilter.mode(
                                            AppColors.darkBlue,
                                            BlendMode.srcIn,
                                          ),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "********* VND",
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
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: (103 / 2) + 24,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        SizedBox(
                          height: 157,
                          child: PageView(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  'lib/assets/images/banner-advertise.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  'lib/assets/images/banner-about.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              Text(
                                "Tiện ích",
                                style: context.typography.h4.copyWith(
                                  color: AppColors.darkBlue,
                                ),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ItemBox(
                                    onTap: () {
                                      Get.toNamed("/transfer");
                                    },
                                    label: "Chuyển tiền",
                                    svgPath:
                                        "lib/assets/svg/transfer-money.svg",
                                  ),
                                  ItemBox(
                                    onTap: () {},
                                    label: "Nạp tiền",
                                    svgPath: "lib/assets/svg/phone-card.svg",
                                  ),
                                  ItemBox(
                                    onTap: () {},
                                    label: "Hóa đơn",
                                    svgPath:
                                        "lib/assets/svg/bill-management.svg",
                                  ),
                                  ItemBox(
                                    onTap: () {},
                                    label: "Tiết kiệm",
                                    svgPath: "lib/assets/svg/saving-plan.svg",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Navbar(),
        ],
      ),
    );
  }
}
