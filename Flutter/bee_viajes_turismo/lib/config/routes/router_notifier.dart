import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterNotifier extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterNotifier({required Stream stream}) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
