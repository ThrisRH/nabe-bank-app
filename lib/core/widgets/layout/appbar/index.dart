import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset("lib/assets/svg/logo.svg"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "lib/assets/svg/setting.svg",
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              SvgPicture.asset(
                "lib/assets/svg/notice-bell.svg",
                height: 18,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              SvgPicture.asset(
                "lib/assets/svg/search.svg",
                height: 18,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
