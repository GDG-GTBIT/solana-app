import 'package:intl/intl.dart';

DateFormat formatter = DateFormat('dd MMM yy');

enum TransactionType { sent, received, pending }

class Transaction {
  Transaction({
    required this.hash,
    required this.from,
    required this.to,
    required this.value,
    required this.timestamp,
    required this.type,
  });

  final String hash;
  final String from;
  final String to;
  final num value;
  final DateTime timestamp;
  TransactionType type;

  String get formattedDate => formatter.format(timestamp);
}
