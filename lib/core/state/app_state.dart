import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountState {
  final bool authenticated;
  final String name;
  final String phone;
  final int balance;
  final int points;

  const AccountState({
    required this.authenticated,
    required this.name,
    required this.phone,
    required this.balance,
    required this.points,
  });

  AccountState copyWith({
    bool? authenticated,
    String? name,
    String? phone,
    int? balance,
    int? points,
  }) => AccountState(
        authenticated: authenticated ?? this.authenticated,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        balance: balance ?? this.balance,
        points: points ?? this.points,
      );
}

class AccountNotifier extends Notifier<AccountState> {
  @override
  AccountState build() => const AccountState(
        authenticated: false,
        name: 'Rafi',
        phone: '0812 3456 7890',
        balance: 1250000,
        points: 840,
      );

  void login(String phone) {
    state = state.copyWith(authenticated: true, phone: phone);
  }

  void logout() => state = state.copyWith(authenticated: false);

  void addBalance(int value) => state = state.copyWith(balance: state.balance + value);

  void subtractBalance(int value) => state = state.copyWith(balance: state.balance - value);
}

final accountProvider = NotifierProvider<AccountNotifier, AccountState>(AccountNotifier.new);

class BalanceVisibilityNotifier extends Notifier<bool> {
  @override
  bool build() => true;
  void toggle() => state = !state;
}

final balanceVisibilityProvider =
    NotifierProvider<BalanceVisibilityNotifier, bool>(BalanceVisibilityNotifier.new);