import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart' as provider;
import '../models/Transaction.dart' as model;
import 'add_transaction.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTransactionScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<provider.TransactionProvider>(  // Menggunakan alias 'provider'
        builder: (context, transactionProvider, child) {
          return Column(
            children: [
              // Ringkasan Saldo
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Pemasukan', style: TextStyle(color: Colors.green)),
                          Text(
                            'Rp ${transactionProvider.getTotalIncome().toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Pengeluaran', style: TextStyle(color: Colors.red)),
                          Text(
                            'Rp ${transactionProvider.getTotalExpense().toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Daftar Transaksi
              Expanded(
                child: ListView.builder(
                  itemCount: transactionProvider.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionProvider.transactions[index];
                    return ListTile(
                      title: Text(transaction.title),
                      subtitle: Text(transaction.date.toString()),
                      trailing: Text(
                        'Rp ${transaction.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: transaction.type == model.TransactionType.income  // Menggunakan alias 'model'
                            ? Colors.green 
                            : Colors.red,
                        ),
                      ),
                      onLongPress: () {
                        transactionProvider.removeTransaction(transaction.id);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTransactionScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
