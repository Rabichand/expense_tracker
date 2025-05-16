import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final void Function(Expense expense) onSubmit;
  final Expense? existingExpense;

  const ExpenseForm({
    super.key,
    required this.onSubmit,
    this.existingExpense,
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.existingExpense != null) {
      _titleController.text = widget.existingExpense!.title;
      _amountController.text = widget.existingExpense!.amount.toString();
      _selectedDate = widget.existingExpense!.date;
    }
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitData() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);
    final date = _selectedDate;

    if (title.isEmpty || amount == null || date == null) return;

    final expense = Expense(
      id: widget.existingExpense?.id ?? DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    widget.onSubmit(expense);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: Text(_selectedDate == null
                    ? 'No Date Chosen!'
                    : 'Picked Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
              ),
              TextButton(
                onPressed: _presentDatePicker,
                child: const Text('Choose Date'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: Text(widget.existingExpense != null ? 'Update Expense' : 'Add Expense'),
          ),
        ],
      ),
    );
  }
}

