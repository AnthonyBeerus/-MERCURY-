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

  List<Expense> get allExpenses => _allExpenses;

  /*

  O P E R A T I O N S

  */

  //* CREATE - add a new expense
  Future<void> addExpense(Expense newExpense) async {
    //* add expense to db
    await isar.writeTxn(() => isar.expenses.put(newExpense));

    //* update local list of expenses
    await readExpense();
  }

  //* READ - expense from db
  Future<void> readExpense() async {
    //* fetch all expenses from db
    List<Expense> fetchedExpense = await isar.expenses.where().findAll();

    //* update local list of expenses
    _allExpenses.clear();
    _allExpenses.addAll(fetchedExpense);

    //* notify listeners
    notifyListeners();
  }

  //* UPDATE - edit an expense in db
  Future<void> updateExpense(int id, Expense updatedExpense) async {
    //* update expense in db
    updatedExpense.id = id;

    //* update in db
    await isar.writeTxn(() => isar.expenses.put(updatedExpense));
    
    //*re-read from db
    await readExpense();
    
  }

  //* DELETE - remove expense from db
  Future<void> deleteExpense(int id) async {

    //* delete expense from db
    await isar.writeTxn(() => isar.expenses.delete(id));

    //*re-read from db
    await readExpense();
  }
  /*

  H E L P E R   F U N C T I O N S

  */
}
