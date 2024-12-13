import 'package:flutter/material.dart';
import 'utils/currency_formatter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Formatter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double nominal = 123456789.0; // Nominal uang yang akan diformat

    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Formatter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nominal: Rp 123456789',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Memanggil CurrencyFormatter untuk menampilkan format Rupiah
            Text(
              'Formatted: ${CurrencyFormatter.format(nominal)}', // Use the format method
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
