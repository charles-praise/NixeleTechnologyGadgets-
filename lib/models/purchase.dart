import 'package:hive/hive.dart';

part 'purchase.g.dart';

@HiveType(typeId: 5)
class Purchase extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String itemPurchased;

  @HiveField(2)
  String repairCost;

  @HiveField(3)
  String? miscellaneous;

  @HiveField(4)
  String? amountSold;

  @HiveField(5)
  String? profit;

  @HiveField(6)
  String? loss;

  Purchase({
    required this.dateTime,
    required this.itemPurchased,
    required this.repairCost,
    this.amountSold,
    this.miscellaneous,
    this.profit,
    this.loss,
  });
}
