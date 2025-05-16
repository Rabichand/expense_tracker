import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/expense_form.dart';
import 'home_tab.dart';
import 'expense_list_tab.dart';
import 'report_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];
  int _selectedIndex = 0;

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _deleteExpense(String id) {
    setState(() {
      _expenses.removeWhere((expense) => expense.id == id);
    });
  }

  void _editExpense(Expense updatedExpense) {
    setState(() {
      final index = _expenses.indexWhere((exp) => exp.id == updatedExpense.id);
      if (index != -1) {
        _expenses[index] = updatedExpense;
      }
    });
  }

  void _openAddExpenseForm([Expense? existingExpense]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ExpenseForm(
          onSubmit: existingExpense == null ? _addExpense : _editExpense,
          existingExpense: existingExpense,
        ),
      ),
    );
  }

  List<Widget> get _tabs => [
        const HomeTab(),
        ExpenseListTab(
          expenses: _expenses,
          onDelete: _deleteExpense,
          onEdit: _openAddExpenseForm,
        ),
        ReportTab(expenses: _expenses),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddExpenseForm(),
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Report'),
        ],
      ),
    );
  }
}


