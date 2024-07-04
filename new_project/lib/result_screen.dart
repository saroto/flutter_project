import 'package:flutter/material.dart';
import 'package:new_project/data/question.dart';
import 'package:new_project/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});
  final List<String> chooseAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].question,
        'correct_answer': question[i].options[0],
        'selected_answer': chooseAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotlaQuestion = question.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['selected_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $numCorrectAnswer out of $numTotlaQuestion questions correctly.",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              QuestionSummary(summaryData),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text("Restart Quiz"),
              )
            ],
          )),
    );
  }
}
