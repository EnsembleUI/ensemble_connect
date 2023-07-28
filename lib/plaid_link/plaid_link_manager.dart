import 'package:ensemble/framework/stub/plaid_link_manager.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class PlaidLinkManagerImpl extends PlaidLinkManager {
  @override
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
