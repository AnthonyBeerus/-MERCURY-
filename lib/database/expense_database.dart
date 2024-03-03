import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_mercury/models/expense.dart';

class ExpenseDatabse extends ChangeNotifier {
  static late Isar isar;
  List<Expense> _allExpenses = [];

  /*

``S E T U P 

  */

  //*initialize db
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpenseSchema], directory: dir.path);
  }
  /*

  G E T T E R S

  */


  /*

  O P E R A T I O N S

  */

  /*

  H E L P E R   F U N C T I O N S

  */
}