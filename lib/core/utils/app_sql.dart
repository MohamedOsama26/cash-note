class AppSql {
  static String createTransactionsTable = 'CREATE TABLE transactions(id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, icon TEXT, amount REAL, created_date TEXT, transaction_date TEXT, notes TEXT, type TEXT)';
}