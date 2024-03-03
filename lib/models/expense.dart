import 'package:isar/isar.dart';
//* this is the model class

//* run cmd in terminal to generate the isar file: dart run build_runner build
part 'expense.g.dart';

@Collection()
class Expense {
  Id id = Isar.autoIncrement;
  final String name;
  final double amount; 
  final DateTime date;
  Expense({
    required this.name, 
    required this.amount, 
    required this.date});
}