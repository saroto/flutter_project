class QuizQuestion {
  const QuizQuestion(
    this.question,
    this.options,
    // required this.correctOptionIndex,
  );
  final String question;
  final List<String> options;
  // int correctOptionIndex;
  List<String> getShuffledOptions() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
