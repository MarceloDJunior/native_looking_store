import 'package:native_looking_store/providers/app_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateProvider>(
      create: (_) => AppStateProvider()..loadProducts(),
      child: const CupertinoStoreApp(),
    ),
  );
}
