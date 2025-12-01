import 'package:get/get.dart';
import 'package:nabe_bank_application/screens/home/index.dart';
import 'package:nabe_bank_application/screens/transfer/transfer_info_step.dart';
import 'package:nabe_bank_application/screens/transfer/transfer_overview_step.dart';
import 'package:nabe_bank_application/screens/transfer/tranfer_result_step.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.transfer,
      page: () => TransferInfoScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.transferOverview,
      page: () => TransferOverviewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.transferResult,
      page: () => TransferResultScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}

class Routes {
  static const home = '/';
  static const transfer = '/transfer';
  static const transferOverview = '/transfer/overview';
  static const transferResult = '/transfer/result';
}
