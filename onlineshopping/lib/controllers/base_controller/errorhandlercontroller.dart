import 'package:onlineshopping/services/api_exception.dart';
import 'package:onlineshopping/utils/dialog_helper.dart';

class ErrorHandler {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(description: error.message ?? '');
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(description: error.message ?? '');
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! taking longer then expected time.');
    } else if (error is UnAuthorizedException) {
      DialogHelper.showErrorDialog(
          title: "Invalid User", description: error.message ?? '');
    }
  }

  showLoading([String message]) {
    DialogHelper.showLoadingDialog(message);
  }

  hideLoading() {
    DialogHelper.hideLoadingDialog();
  }
}
