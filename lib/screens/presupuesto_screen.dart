import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/payment_method.dart';
import '../widgets/dev_drawer.dart';

class PresupuestoScreen extends StatefulWidget {
  const PresupuestoScreen({Key? key}) : super(key: key);

  @override
  State<PresupuestoScreen> createState() => _PresupuestoScreenState();
}

class _PresupuestoScreenState extends State<PresupuestoScreen> {
  final _formKey = GlobalKey<FormState>();
  double? _amount;
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presupuesto'),
      ),
      drawer: const DevDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de monto
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ingrese el monto a pagar',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un monto';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Ingrese un monto válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.tryParse(value ?? '0');
                },
              ),

              const SizedBox(height: 24),
              Text(
                'Método de pago',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Métodos de pago
              ...PaymentMethod.values.map((method) => _PaymentMethodCard(
                method: method,
                isSelected: _selectedMethod == method,
                onTap: () {
                  setState(() {
                    _selectedMethod = method;
                  });
                },
              )),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _selectedMethod == null ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('ACEPTAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // TODO: Procesar el pago según el método seleccionado
      if (_selectedMethod == PaymentMethod.qr) {
        _showQRDialog();
      } else {
        // Navegar a la siguiente pantalla
        Navigator.pushNamed(context, '/mapa');
      }
    }
  }

  void _showQRDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pago por QR'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: Implementar generador de QR
            const Icon(Icons.qr_code, size: 200),
            const SizedBox(height: 16),
            Text('Monto a pagar: \$${_amount?.toStringAsFixed(2)}'),
            const Text('Escanea el QR con tu aplicación bancaria'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/mapa');
            },
            child: const Text('CONTINUAR'),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodCard({
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                method.icon,
                color: isSelected ? theme.colorScheme.primary : null,
                size: 28,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  method.displayName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isSelected ? theme.colorScheme.primary : null,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
} 
