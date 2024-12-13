import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDeleteTransaction;

  const TransactionList(this.transactions, this.onDeleteTransaction, {super.key});

  // Category icon mapping
  IconData _getCategoryIcon(String category, TransactionType type) {
    if (type == TransactionType.income) {
      return Icons.attach_money;
    }

    switch (category.toLowerCase()) {
      case 'makanan':
        return Icons.restaurant;
      case 'transportasi':
        return Icons.directions_car;
      case 'belanja':
        return Icons.shopping_bag;
      case 'hiburan':
        return Icons.movie;
      case 'lainnya':
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_wallet.png',
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'Belum ada transaksi',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Tambahkan transaksi pertamamu',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return Dismissible(
                key: Key(transaction.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  onDeleteTransaction(transaction.id);
                },
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: transaction.type == TransactionType.income 
                          ? Colors.green.shade50 
                          : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        _getCategoryIcon(transaction.category, transaction.type),
                        color: transaction.type == TransactionType.income 
                          ? Colors.green.shade700 
                          : Colors.red.shade700,
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('dd MMM yyyy').format(transaction.date),
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Text(
                      '${transaction.type == TransactionType.income ? '+' : '-'} Rp ${NumberFormat('#,##0', 'id_ID').format(transaction.amount)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: transaction.type == TransactionType.income 
                          ? Colors.green[700] 
                          : Colors.red[700],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}