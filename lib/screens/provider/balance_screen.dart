import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saldo Acumulado'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildTransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Saldo Disponible',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '\$5,678.90',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implementar retiro de saldo
              },
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text('Retirar Saldo'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Últimos Movimientos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _mockTransactions.length,
          itemBuilder: (context, index) {
            final transaction = _mockTransactions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(
                  transaction.type == 'ingreso' ? Icons.add_circle : Icons.remove_circle,
                  color: transaction.type == 'ingreso' ? Colors.green : Colors.red,
                ),
                title: Text(transaction.description),
                subtitle: Text(transaction.date),
                trailing: Text(
                  transaction.amount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: transaction.type == 'ingreso' ? Colors.green : Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// Mock data
class Transaction {
  final String description;
  final String date;
  final String amount;
  final String type;

  Transaction({
    required this.description,
    required this.date,
    required this.amount,
    required this.type,
  });
}

final _mockTransactions = [
  Transaction(
    description: 'Comisión Tour Ciudad',
    date: '15/03/2024',
    amount: '+\$45.00',
    type: 'ingreso',
  ),
  Transaction(
    description: 'Retiro a cuenta bancaria',
    date: '14/03/2024',
    amount: '-\$100.00',
    type: 'retiro',
  ),
  Transaction(
    description: 'Comisión Excursión Playa',
    date: '13/03/2024',
    amount: '+\$60.00',
    type: 'ingreso',
  ),
]; 
