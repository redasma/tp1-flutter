class Question{

  final String id;
  final String questionText;
  bool isCorrect;
  final String categorie;

  Question({
    required this.id,
    required this.questionText,
    required this.isCorrect,
    required this.categorie,
});

  @override
  String toString(){
    return 'Question(id:$id, title: $questionText, answer: $isCorrect)';
  }
}