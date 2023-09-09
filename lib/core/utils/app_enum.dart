enum TransactionType {
  income('Income'),
  expense('Expense');

  final String value;

  const TransactionType(this.value);

  static TransactionType getType(String name) =>
      TransactionType.values.byName(name);

  static String getName(TransactionType type) => type.name;
}
