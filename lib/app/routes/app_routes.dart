part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ONBORDING = _Paths.ONBORDING;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const PRODUCT = _Paths.PRODUCT;
  static const DETAILSPRODUCT = _Paths.DETAILSPRODUCT;

}

abstract class _Paths {
  _Paths._();
  static const ONBORDING = '/onbording';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const PRODUCT = '/product';
  static const DETAILSPRODUCT = '/detailsproduct';

}