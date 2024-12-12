class Project {
  final String id;
  final String title;
  final String description;
  bool inProgress;
  final DateTime createdAt;

  Project({
    required this.id,
    required this.title,
    required this.description,
    this.inProgress = true,
  }) : createdAt = DateTime.now();

  static List<Project> projectList() {
    return [
      Project( title : 'Amigurumi gato', description: 'Amigurumi tamanho G cinza para presente', inProgress: true, id: '1'),
      Project( title : 'Tapete vermelho', description: 'Tapete para presente', inProgress: false, id: '2'),
      Project( title : 'Amigurumi dinossauro', description: 'Amigurumi  para o Allef', inProgress: true, id: '3'),
      Project( title : 'Vestido', description: 'Vestido para o ano novo', inProgress: true, id: '4'),

    ];
  }
}
