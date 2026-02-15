import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/hive_boxes.dart';
import 'models/affiliate.dart';
import 'models/capital.dart';
import 'models/debtors.dart';
import 'models/debts.dart';
import 'models/purchase.dart';
import 'screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. initialize Hive (create folders in app documents)
  await Hive.initFlutter();

  // 2. run this command """  flutter pub run build_runner build --delete-conflicting-outputs """
  // to auto-generate the adapters after writing creating your models
  Hive.registerAdapter(AffilliateItemsAdapter());
  Hive.registerAdapter(CapitalAdapter());
  Hive.registerAdapter(DebtorsAdapter());
  Hive.registerAdapter(DebtsAdapter());
  Hive.registerAdapter(PurchaseAdapter());

  // 3. open all boxes you plan to use.
  await Future.wait([
    Hive.openBox(HiveBoxes.affiliateItems),
    Hive.openBox(HiveBoxes.capital),
    Hive.openBox(HiveBoxes.debtors),
    Hive.openBox(HiveBoxes.purchase),
    Hive.openBox(HiveBoxes.debts),
  ]);

  // 4. run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NixGadgets",
      theme: ThemeData(),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
