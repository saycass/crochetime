class Wish {
  final String id;
  final String description;
  bool isDone;
  final DateTime createdAt;

  Wish({
    required this.description,
    this.isDone = false,
    required this.id,
  }) : createdAt = DateTime.now();

  static List<Wish> wishList() {
    return [
      Wish(description: 'Comprar linha amigurumi', isDone: true, id: '1'),
      Wish(description: 'Comprar agulha número 6', isDone: false, id: '2'),
      Wish(description: 'Comprar lã batik circulo', isDone: false, id: '3'),
      Wish(description: 'Comprar marcador de pontos', isDone: true, id: '4'),
      Wish(description: 'Comprar tesoura', isDone: true, id: '5'),
    ];
  }
}
