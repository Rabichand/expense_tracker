import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/monthly_report.dart';

class ReportTab extends StatelessWidget {
  final List<Expense> expenses;

  const ReportTab({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return MonthlyReport(expenses: expenses);
  }
}
