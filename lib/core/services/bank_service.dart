import 'package:dio/dio.dart';
import 'package:nabe_bank_application/core/models/bank_model.dart';

class BankService {
  final dio = Dio();

  Future<BankResponse> fetchAllBank() async {
    final path = "https://api.vietqr.io/v2/banks";

    try {
      final response = await dio.get(path);
      return BankResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
