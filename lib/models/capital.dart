import 'package:hive/hive.dart';

part 'capital.g.dart';

@HiveType(typeId: 4)
class Capital extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String amountDeposited;

  @HiveField(2)
  String amountUsed;

  @HiveField(3)
  String? profit;

  @HiveField(4)
  String? loss;

  @HiveField(5)
  String total;

  Capital({
    required this.dateTime,
    required this.amountDeposited,
    required this.amountUsed,
    this.profit,
    this.loss,
    required this.total,
  });
}
