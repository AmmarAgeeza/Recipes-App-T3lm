import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes_app_t3lm/core/constants/app_import.dart';

void showToast({required ToastState state, required String message}) {
  Color getColor() {
    switch (state) {
      case ToastState.success:
        return Colors.green;
      case ToastState.error:
        return Colors.red;
      case ToastState.warning:
        return Colors.grey;
    }
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: getColor(),
    textColor: AppColors.bodyText,
    fontSize: 16,
  );
}
