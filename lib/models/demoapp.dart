class DemoModel {
  static List<Item> items = [];

  //get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by Positon
  Item getbyPos(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String company;
  final num price;
  final String color;
  final String image;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Item({
    this.id,
    this.name,
    this.company,
    this.price,
    this.color,
    this.image,
  });

  Item copyWith({
    int id,
    String name,
    String company,
    num price,
    String color,
    String image,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (company == null || identical(company, this.company)) &&
        (price == null || identical(price, this.price)) &&
        (color == null || identical(color, this.color)) &&
        (image == null || identical(image, this.image))) {
      return this;
    }

    return new Item(
      id: id ?? this.id,
      name: name ?? this.name,
      company: company ?? this.company,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name, company: $company, price: $price, color: $color, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          company == other.company &&
          price == other.price &&
          color == other.color &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      company.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode;

  factory Item.fromMap(Map<String, dynamic> map) {
    return new Item(
      id: map['id'] as int,
      name: map['name'] as String,
      company: map['company'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'company': this.company,
      'price': this.price,
      'color': this.color,
      'image': this.image,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
