class Item {
  String title;
  num price;
  num ProductId;
  Item(this.ProductId, this.price, this.title);

  Map<String, dynamic> toMap() => {
        'productId': ProductId,
        'name': title,
        'price': price,
      };
}
