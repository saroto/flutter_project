import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widget/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        category: Category.Food),
    Expense(
        title: 'Taxi',
        amount: 30.0,
        date: DateTime.now(),
        category: Category.Travel),
    // Expense(
    //     title: 'Movie',
    //     amount: 20.0,
    //     date: DateTime.now(),
    //     category: Category.Leisure),
    // Expense(
    //     title: 'Laptop',
    //     amount: 1000.0,
    //     date: DateTime.now(),
    //     category: Category.Work),
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(
      () {
        _registerExpenses.remove((expense));
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onDeleteExpense: _deleteExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAddExpenseOverlay,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registerExpenses),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registerExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
