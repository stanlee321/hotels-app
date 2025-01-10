import 'package:flutter/material.dart';

enum PaymentMethod {
  card,
  cash,
  transfer,
  qr;

  String get displayName {
    switch (this) {
      case PaymentMethod.card:
        return 'Pago con tarjeta';
      case PaymentMethod.cash:
        return 'Efectivo';
      case PaymentMethod.transfer:
        return 'Transferencia bancaria';
      case PaymentMethod.qr:
        return 'Pago por QR';
    }
  }

  IconData get icon {
    switch (this) {
      case PaymentMethod.card:
        return Icons.credit_card;
      case PaymentMethod.cash:
        return Icons.payments;
      case PaymentMethod.transfer:
        return Icons.account_balance;
      case PaymentMethod.qr:
        return Icons.qr_code;
    }
  }
} 
