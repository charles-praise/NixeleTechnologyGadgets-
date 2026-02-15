import 'package:hive/hive.dart';

part 'debtors.g.dart';

@HiveType(typeId: 1)
class Debtors extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String debtorsName;

  @HiveField(2)
  String amountOwed;

  @HiveField(3)
  String paymentDuration;

  @HiveField(4)
  bool? acceptInstallment;

  @HiveField(5)
  String? installmentAmount;

  @HiveField(6)
  bool paid;

  Debtors({
    required this.dateTime,
    required this.debtorsName,
    required this.paymentDuration,
    this.acceptInstallment,
    this.installmentAmount,
    required this.paid,
    required this.amountOwed,
  });
}
