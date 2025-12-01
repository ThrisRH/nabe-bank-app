import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyInputFormatter extends TextInputFormatter {
  final _formatter = NumberFormat.decimalPattern('vi_VN');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Khi xóa hết thì return chuỗi rỗng
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Loại bỏ dấu chấm cũ
    String numericString = newValue.text.replaceAll('.', '');

    // Nếu không phải số → không cập nhật
    if (int.tryParse(numericString) == null) {
      return oldValue;
    }

    // Format lại
    String formatted = _formatter.format(int.parse(numericString));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
