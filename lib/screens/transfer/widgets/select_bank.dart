import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/models/bank_model.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/input/icon_input.dart';

class SelectBankPopup extends StatelessWidget {
  final List<BankModel> data;
  const SelectBankPopup({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Container(
      height: 543,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        spacing: 12,
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFF2D4769).withValues(alpha: 0.15),
                ),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Chọn ngân hàng",
                    style: context.typography.h4.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: IconInput(
              keyboardType: TextInputType.text,
              controller: searchController,
              onChanged: (v) => {},
              hint: "Tìm kiếm ngân hàng",
              icon: SvgPicture.asset("lib/assets/svg/search.svg"),
              label: '',
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final bank = data[index];
                print(bank);

                return _BankItem(
                  bankSlugName: bank.shortName,
                  bankFullName: bank.name,
                  logoUrl: bank.logo,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BankItem extends StatelessWidget {
  final String bankSlugName;
  final String bankFullName;
  final String logoUrl;
  const _BankItem({
    required this.bankSlugName,
    required this.bankFullName,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back(result: bankFullName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderMoreOpacity),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              spacing: 12,
              children: [
                Image.network(logoUrl, width: 24, height: 24),
                Text(
                  bankSlugName,
                  style: context.typography.body1.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            Text(
              bankFullName,
              style: context.typography.body4.copyWith(
                color: AppColors.placeHolder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
