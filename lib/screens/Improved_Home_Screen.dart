import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount) {
    if (title.isEmpty || amount <= 0) {
      return; // Tambahkan logika untuk menangani input yang tidak valid
    }

    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) => AddTransactionScreen(_addTransaction)),
    );
  }

  double _calculateTotalExpenses() {
    return _transactions.fold(0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Keuangan'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Total Expenses Card
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Pengeluaran: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp ${_calculateTotalExpenses().toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Transaction List
          Expanded(
            child: TransactionList(_transactions),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// Pastikan Anda memiliki kelas Transaction dan AddTransactionScreen yang sesuai
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tx = transactions[index];
        return ListTile(
          title: Text(tx.title),
          subtitle: Text(tx.date.toString()),
          trailing: Text('Rp ${tx.amount.toStringAsFixed(0)}'),
        );
      },
    );
  }
}

class AddTransactionScreen extends StatelessWidget {
  final Function(String, double) addTx;

  const AddTransactionScreen(this.addTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementasi untuk menambahkan transaksi baru
    return Container(); // Ganti dengan UI untuk menambahkan transaksi
  }
}