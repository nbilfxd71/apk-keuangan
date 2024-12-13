import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Transaction.dart';

// Halaman untuk menambah transaksi
class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  TransactionType _transactionType = TransactionType.income;

  // Fungsi untuk menambahkan data transaksi
  _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount == null || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // Membuat objek transaksi baru
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: enteredTitle,
      date: _selectedDate!,
      amount: enteredAmount,
      type: _transactionType,
      category: 'Default', // Menambahkan kategori default
    );

    // Menambahkan transaksi ke provider
    Provider.of<TransactionProvider>(context, listen: false).addTransaction(newTransaction);

    // Kembali ke halaman sebelumnya setelah menambahkan transaksi
    Navigator.of(context).pop();
  }

  // Fungsi untuk memilih tanggal transaksi
  _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null) {
      return;
    }
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Judul Transaksi'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Text('Jenis Transaksi: '),
                DropdownButton<TransactionType>(
                  value: _transactionType,
                  onChanged: (newValue) {
                    setState(() {
                      _transactionType = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: TransactionType.income,
                      child: Text('Pemasukan'),
                    ),
                    DropdownMenuItem(
                      value: TransactionType.expense,
                      child: Text('Pengeluaran'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(_selectedDate == null
                    ? 'Pilih Tanggal'
                    : 'Tanggal: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Tambah Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}
