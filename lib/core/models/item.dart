class Item {
  final int id;
  final String asset;
  bool visible;
  bool done;

  Item({
    required this.id,
    required this.asset,
    required this.visible,
    required this.done,
  });

  Item copyWith({
    int? id,
    String? asset,
    bool? visible,
    bool? done,
  }) {
    return Item(
      id: id ?? this.id,
      asset: asset ?? this.asset,
      visible: visible ?? this.visible,
      done: done ?? this.done,
    );
  }
}

List<Item> itemsList1 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
];

List<Item> itemsList2 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
  Item(id: 7, asset: 'assets/items/7', visible: false, done: false),
  Item(id: 8, asset: 'assets/items/8', visible: false, done: false),
];

List<Item> itemsList3 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
  Item(id: 7, asset: 'assets/items/7', visible: false, done: false),
  Item(id: 8, asset: 'assets/items/8', visible: false, done: false),
  Item(id: 9, asset: 'assets/items/9', visible: false, done: false),
  Item(id: 10, asset: 'assets/items/10', visible: false, done: false),
];

List<Item> itemsList4 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
  Item(id: 7, asset: 'assets/items/7', visible: false, done: false),
  Item(id: 8, asset: 'assets/items/8', visible: false, done: false),
  Item(id: 9, asset: 'assets/items/9', visible: false, done: false),
  Item(id: 10, asset: 'assets/items/10', visible: false, done: false),
  Item(id: 11, asset: 'assets/items/11', visible: false, done: false),
  Item(id: 12, asset: 'assets/items/12', visible: false, done: false),
];

List<Item> itemsList5 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
  Item(id: 7, asset: 'assets/items/7', visible: false, done: false),
  Item(id: 8, asset: 'assets/items/8', visible: false, done: false),
  Item(id: 9, asset: 'assets/items/9', visible: false, done: false),
  Item(id: 10, asset: 'assets/items/10', visible: false, done: false),
  Item(id: 11, asset: 'assets/items/11', visible: false, done: false),
  Item(id: 12, asset: 'assets/items/12', visible: false, done: false),
  Item(id: 13, asset: 'assets/items/13', visible: false, done: false),
  Item(id: 14, asset: 'assets/items/14', visible: false, done: false),
  Item(id: 15, asset: 'assets/items/15', visible: false, done: false),
];

List<Item> itemsList6 = [
  Item(id: 1, asset: 'assets/items/1', visible: false, done: false),
  Item(id: 2, asset: 'assets/items/2', visible: false, done: false),
  Item(id: 3, asset: 'assets/items/3', visible: false, done: false),
  Item(id: 4, asset: 'assets/items/4', visible: false, done: false),
  Item(id: 5, asset: 'assets/items/5', visible: false, done: false),
  Item(id: 6, asset: 'assets/items/6', visible: false, done: false),
  Item(id: 7, asset: 'assets/items/7', visible: false, done: false),
  Item(id: 8, asset: 'assets/items/8', visible: false, done: false),
  Item(id: 9, asset: 'assets/items/9', visible: false, done: false),
  Item(id: 10, asset: 'assets/items/10', visible: false, done: false),
  Item(id: 11, asset: 'assets/items/11', visible: false, done: false),
  Item(id: 12, asset: 'assets/items/12', visible: false, done: false),
  Item(id: 13, asset: 'assets/items/13', visible: false, done: false),
  Item(id: 14, asset: 'assets/items/14', visible: false, done: false),
  Item(id: 15, asset: 'assets/items/15', visible: false, done: false),
  Item(id: 16, asset: 'assets/items/16', visible: false, done: false),
  Item(id: 17, asset: 'assets/items/17', visible: false, done: false),
  Item(id: 18, asset: 'assets/items/18', visible: false, done: false),
];
