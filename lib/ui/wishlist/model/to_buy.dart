class ToBuy {
  final String id;
  final String description;
  bool isDone;
  final DateTime createdAt;

  ToBuy({
    required this.description,
    this.isDone = false,
    required this.id,
  }) : createdAt = DateTime.now();

  static List<ToBuy> toBuyList() {
    return [
      ToBuy(description: 'Comprar linha amigurumi', isDone: true, id: '1'),
      ToBuy(description: 'Comprar agulha número 6', isDone: true, id: '2'),
      ToBuy(description: 'Comprar lã batik circulo', isDone: true, id: '3'),
      ToBuy(description: 'Comprar marcador de pontos', isDone: true, id: '4'),
      ToBuy(description: 'Comprar tesoura', isDone: true, id: '5'),
    ];
  }

}
