// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletServicesHash() => r'f5afe444497cd5c10fab208f027788b0ecd0cca3';

/// See also [WalletServices].
@ProviderFor(WalletServices)
final walletServicesProvider =
    NotifierProvider<WalletServices, Wallet>.internal(
  WalletServices.new,
  name: r'walletServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WalletServices = Notifier<Wallet>;
String _$balanceHash() => r'7e2516fe086a48238599c1ca04b685fd2a54d264';

/// See also [Balance].
@ProviderFor(Balance)
final balanceProvider = NotifierProvider<Balance, double>.internal(
  Balance.new,
  name: r'balanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$balanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Balance = Notifier<double>;
String _$transactionsHash() => r'77553b547c55e59b8c1f2f47103d9957afa275b9';

/// See also [Transactions].
@ProviderFor(Transactions)
final transactionsProvider =
    NotifierProvider<Transactions, List<Transaction>>.internal(
  Transactions.new,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Transactions = Notifier<List<Transaction>>;
String _$refreshHash() => r'c8f41f1957e656aae07e04e42e755d2d5d5ce622';

/// See also [Refresh].
@ProviderFor(Refresh)
final refreshProvider = NotifierProvider<Refresh, bool>.internal(
  Refresh.new,
  name: r'refreshProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$refreshHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Refresh = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
