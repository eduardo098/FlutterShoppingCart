class Item {
  final String id;
  final String imgUrl;
  final String titulo;
  final String descripcion;
  final double precio;
  final String color;

  Item ({this.id, this.imgUrl, this.titulo, this.descripcion, this.precio, this.color});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'] as String,
      imgUrl: json['imgUrl'] as String,
      titulo: json['titulo'] as String,
      descripcion: json['descripcion'] as String,
      precio: json['precio'] as double,
      color: json['color'] as String
    );
  }
}