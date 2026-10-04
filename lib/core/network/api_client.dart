import 'package:dio/dio.dart';
import '../config/app_config.dart';

class ApiEndpoints {
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const authOtpVerify = '/auth/login/otp/verify';
  static const authOtpResend = '/auth/login/otp/resend';
  static const authLogout = '/auth/logout';
  static const authMe = '/auth/me';
  static const authRefresh = '/auth/refresh';
  static const transfer = '/transfer';
  static const transferLookup = '/transfer/lookup';
  static const transferRecent = '/transfer/recent';
  static const transferMyQr = '/transfer/my-qr';
  static const transferResolveQr = '/transfer/resolve-qr';
  static const paymentStatus = '/payment/status';
  static const catalog = '/catalog';
  static const banners = '/banners';
  static const flashSale = '/catalog/flash-sale';
  static const order = '/mobile/order';
  static const orderStatus = '/order-status';
  static const voucher = '/order/voucher';
  static const pointsSummary = '/points/summary';
  static const pointsMutations = '/points/mutations';
  static const pointsRedeem = '/points/redeem';
  static const notifications = '/notifications';
  static const devices = '/devices';
  static const profile = '/profile/summary';
  static const disbursement = '/disbursement';
  static const disbursementConfig = '/disbursement/config';
  static const disbursementInquiry = '/disbursement/inquiry';
  static const merchant = '/merchant';
  static const merchantStatus = '/merchant/status';
  static const merchantSummary = '/merchant/summary';
  static const merchantPayments = '/merchant/payments';
}

class ApiClient {
  ApiClient() : dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));
  final Dio dio;

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? query}) =>
      dio.get<T>(path, queryParameters: query);

  Future<Response<T>> post<T>(String path, {Object? data}) =>
      dio.post<T>(path, data: data);
}
