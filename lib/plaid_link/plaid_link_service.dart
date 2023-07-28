import 'package:ensemble/widget/plaid_link/plaid_link_controller.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class PlaidLinkService {
  static final PlaidLinkService _instance = PlaidLinkService._internal();
  PlaidLinkService._internal();

  factory PlaidLinkService() {
    return _instance;
  }

  void openPlaidLink(String plaidLink, PlaidLinkSuccessCallback onSuccess,
      PlaidLinkEventCallback onEvent, PlaidLinkErrorCallback onExit) {
    // Subscribe to all events

    PlaidLink.onSuccess.listen((successData) {
      onSuccess(successData.toJson());
    });
    PlaidLink.onEvent.listen((eventData) {
      onEvent(eventData.toJson());
    });
    PlaidLink.onExit.listen((exitData) {
      onExit(exitData.toJson());
    });

    PlaidLink.open(configuration: LinkTokenConfiguration(token: plaidLink));
  }
}
