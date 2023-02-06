class Item {
  final int? id;
  final String type;
  final String title;
  final String? subTitle;
  final double amount;
  final String creationDate;

  Item({
    this.id,
    required this.type,
    required this.title,
    this.subTitle,
    required this.amount,
    required this.creationDate,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'subtitle': subTitle,
        'amount': amount,
        'creation_date': creationDate,
      };

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json['title'],
        amount: json['amount'],
        creationDate: json['creation_date'],
        type: json['type'],
        id: json['id'],
        subTitle: json['subtitle'],
      );

  @override
  String toString() {
    return 'Item{ id: $id , type: $type, title: $title, subtitle: $subTitle, amount: $amount, creation_date: $creationDate}';
  }
}
