// lib/widgets/expense_list.dart
import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(String id) onDelete;
  final void Function(Expense expense) onEdit;

 const ExpenseList({
  super.key,
  required this.expenses,
  required this.onDelete,
  required this.onEdit,
});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(expense.title),
            subtitle: Text(DateFormat.yMMMd().format(expense.date)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => onEdit(expense),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onDelete(expense.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

