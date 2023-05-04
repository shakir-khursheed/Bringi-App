import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/service_locator/service_locator.dart';
import 'package:flutter/foundation.dart';

abstract class BaseRepo<W extends BaseWebApi> {
  final W _webApi = serviceLocator<W>();

  @protected
  W get webApi => _webApi;
}
