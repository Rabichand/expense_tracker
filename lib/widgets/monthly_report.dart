import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class MonthlyReport extends StatelessWidget {
  final List<Expense> expenses;

  const MonthlyReport({super.key, required this.expenses});

  double _getMonthlyTotal(DateTime month) {
    return expenses
        .where((e) =>
            e.date.year == month.year && e.date.month == month.month)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final thisMonth = DateTime(now.year, now.month);
    final lastMonth = DateTime(now.year, now.month - 1);

    final thisMonthTotal = _getMonthlyTotal(thisMonth);
    final lastMonthTotal = _getMonthlyTotal(lastMonth);

    double difference = thisMonthTotal - lastMonthTotal;
    String status = difference == 0
        ? "Same as last month"
        : difference > 0
            ? "↑ ₹${difference.toStringAsFixed(2)} more than last month"
            : "↓ ₹${(-difference).toStringAsFixed(2)} less than last month";

    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Monthly Report',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This Month (${DateFormat.MMMM().format(thisMonth)}): ₹${thisMonthTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Last Month (${DateFormat.MMMM().format(lastMonth)}): ₹${lastMonthTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Difference: $status',
              style: TextStyle(
                  fontSize: 16,
                  color: difference > 0 ? Colors.red : Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
