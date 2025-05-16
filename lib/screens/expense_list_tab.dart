import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/expense_list.dart';

class ExpenseListTab extends StatelessWidget {
  final List<Expense> expenses;
  final Function(String) onDelete;
  final Function(Expense) onEdit;

  const ExpenseListTab({
    super.key,
    required this.expenses,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ExpenseList(
      expenses: expenses,
      onDelete: onDelete,
      onEdit: onEdit,
    );
  }
}
