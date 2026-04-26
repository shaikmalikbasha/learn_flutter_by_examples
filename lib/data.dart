class Question {
  String questionText;
  bool answer;
  Question({required this.questionText, required this.answer});
}

class QuizBrain {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Is India a Country?', answer: true),
    Question(questionText: 'Is Mumbai the capital of India?', answer: false),
    Question(questionText: 'Is Delhi the capital of India?', answer: true),
  ];

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].answer;
  }

  bool isFinished() {
    return _questionIndex >= _questionBank.length - 1;
  }

  int getQuestionBankLength() {
    return _questionBank.length;
  }

  void reset() {
    _questionIndex = 0;
  }

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }
}

List<Map<String, Object>> getQuestionBank() {
  return [
    {
      "question": "How many IPL teams are there?",
      "answer": "10",
      "options": ["8", "10", "12", "14"],
    },
    {
      "question": "Which team has won the most IPL titles?",
      "answer": "Chennai Super Kings",
      "options": [
        "Chennai Super Kings",
        "Royal Challengers Bangalore",
        "Kolkata Knight Riders",
        "Sunrisers Hyderabad",
      ],
    },
    {
      "question": "Who is the highest run-scorer in IPL history?",
      "answer": "Virat Kohli",
      "options": ["Chris Gayle", "Virat Kohli", "Suresh Raina", "David Warner"],
    },
    {
      "question": "Which team won the inaugural IPL season in 2008?",
      "answer": "Rajasthan Royals",
      "options": [
        "Rajasthan Royals",
        "Chennai Super Kings",
        "Mumbai Indians",
        "Kolkata Knight Riders",
      ],
    },
    {
      "question":
          "Who holds the record for the most wickets in a single IPL season?",
      "answer": "Dwayne Bravo",
      "options": [
        "Dwayne Bravo",
        "Lasith Malinga",
        "Bhuvneshwar Kumar",
        "Jasprit Bumrah",
      ],
    },
  ];
}
