import 'package:pizza_order/shared/shared.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentServices {
  static Razorpay? _razorpay;

  static void initRazorPay() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  static void clear() {
    _razorpay!.clear();
  }

  static void checkOut({required int totalPrice}) {
    final _options = {
      'key': 'rzp_test_2hAKCBM8lacsxH',
      'amoutn': totalPrice,
      'name': 'test',
      'description': "payment via RazorPay",
      'prefill': {
        'contact': '555555555',
        'email': 'test@gmail.com',
      },
    };

    try {
      _razorpay!.open(_options);
    } catch (err) {
      defaultToast('error: ${err.toString()}');
    }
  }

  //Payment States Handlers

  static void _handlePaymentSuccess(PaymentSuccessResponse response) async =>
      defaultToast('success: ${response.signature}');
  static void _handlePaymentError(PaymentFailureResponse response) =>
      defaultToast('fail: ${response.message}');
  static void _handleExternalWallet(ExternalWalletResponse response) =>
      defaultToast('wallet: ${response.walletName}');
}
