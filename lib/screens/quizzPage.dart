import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/models/question.dart';
import '../models/constants.dart';
import 'package:tp1/widgets/questionWidget.dart';
import 'package:tp1/widgets/nextButton.dart';
import '../widgets/answerWidget.dart';
import '../widgets/resultBox.dart';
import '../widgets/ImageWidget.dart';
class QuizzPage extends StatefulWidget{
  const QuizzPage ({Key? key}) : super(key:key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage>{
  List<Question> _questions = [
    Question(id: '1', questionText: '4 + 4 = 8', isCorrect: true, categorie: 'math'),
    Question(id: '1', questionText: 'Edward philipe est le president de la france ', isCorrect: false, categorie:'france'),
    Question(id: '1', questionText: 'l argentine a gagné la coupe du monde 2022' , isCorrect: true, categorie: 'foot')
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool alreadySelected = false;

  void nextQuestion(){
    if(index == _questions.length - 1){
      showDialog(context: context,
          barrierDismissible:false,
          builder: (ctx) => ResultBox(result: score,questionLength: _questions.length,restart: restart,));
    }else if(isPressed){
      setState(() {
        index++;
        isPressed = false;
        alreadySelected = false;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text('please select an answer'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical:20.0),
          ),
      );
    }

  }

  void changeCardState(bool value){
    if(alreadySelected){
      return;
    }else{

    if(value == _questions[index].isCorrect){
      ++score;
    }
    setState(() {
      isPressed = true;
      alreadySelected = true;
    });
  }
  }

  void restart(){
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      alreadySelected = false;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroud,
      appBar: AppBar(
        title: const Text('Quizz App'),
        backgroundColor: backgroud,
        shadowColor: Colors.transparent,
        actions: [
          Padding(padding: const EdgeInsets.all(18.0),
          child:Text('score : $score',
          style: TextStyle(
            fontSize: 18.0,
          ),),
    )],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        child: Column(
          children: [
            ImageWidget(url: 'assets/images/' + _questions[index].categorie + '.jpg'),
            QuestionWidget(question: _questions[index].questionText, index: index, nbQuestions: _questions.length),
            const Divider(color: neutre,),
            const SizedBox(height: 20.0,),
            AnswerWidget(option: 'Vrai', color: isPressed ? _questions[index].isCorrect ? correct: incorrect : neutre, onTap:() => changeCardState(true), ),
            AnswerWidget(option: 'Faux', color: isPressed ? _questions[index].isCorrect ? incorrect : correct: neutre, onTap: () => changeCardState(false),),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}