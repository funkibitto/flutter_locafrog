import 'package:get/get.dart';
import 'dart:async';

import 'package:async/async.dart';

class SplashService extends GetxService {
  final welcomeStr = ['Harder', 'Better', 'Faster', 'Stronger'];
  final activeStr = 0.obs;

  final memo = AsyncMemoizer<void>();
  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  void _changeActiveString() {
    activeStr.value = (activeStr.value + 1) % welcomeStr.length;
  }

  Future<void> _initFunction() async {
    final t = Timer.periodic(
      const Duration(milliseconds: 300),
      (t) => _changeActiveString(),
    );
    //simulate some long running operation
    await Future.delayed(const Duration(seconds: 3));
    //cancel the timer once we are done
    t.cancel();
  }
}
