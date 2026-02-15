import 'package:hive/hive.dart';

part 'debts.g.dart';

@HiveType(typeId: 2)
class Debts extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String amountOwed;

  @HiveField(2)
  String paymentDuration;

  @HiveField(3)
  bool? acceptsInstallment;

  @HiveField(4)
  bool paid;

  Debts({
    required this.dateTime,
    required this.amountOwed,
    required this.paymentDuration,
    this.acceptsInstallment,
    required this.paid,
  });
}
