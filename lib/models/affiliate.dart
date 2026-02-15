import 'package:hive/hive.dart';

part 'affiliate.g.dart';

@HiveType(typeId: 3)
class AffilliateItems extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String affiliateItem;

  @HiveField(2)
  String amountTaken;

  @HiveField(3)
  String agreedDuration;

  @HiveField(4)
  String? profit;

  @HiveField(5)
  String? loss;

  @HiveField(6)
  String? total;

  AffilliateItems({
    required this.dateTime,
    required this.affiliateItem,
    required this.amountTaken,
    required this.agreedDuration,
    this.profit,
    this.loss,
    this.total,
  });
}
