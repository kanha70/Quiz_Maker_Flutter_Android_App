import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/Services/database.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  //const CreateQuiz({Key? key}) : super(key: key);

     @override
     _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

      final _formKey = GlobalKey<FormState>();
      String quizImageUrl, quizTitle, quizDescription, quizId;
      DatabaseService databaseService = new DatabaseService();

      bool _isLoading = false;

      createQuizOnline() async {
            
          if (_formKey.currentState.validate()){

               setState(() {
                 _isLoading = true;
               });

               quizId = randomAlphaNumeric(16);

               Map<String, String> quizMap = {
                       "quizId" : quizId,
                       "quizImgUrl" : quizImageUrl,
                       "quizTitle" : quizTitle,
                       "quizDesc" : quizDescription
               };

            await databaseService.addQuizData(quizMap, quizId).then((value){
                   setState(() {
                        _isLoading = false;
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (contex) => AddQuestion(quizId)
                        ));
                   });
            });
          }
      }

      @override
          Widget build(BuildContext context) {
          return Scaffold(
                     appBar: AppBar(
                           title: appBar(context),
                           backgroundColor: Colors.transparent,
                           elevation: 0.0,
                           iconTheme: IconThemeData(color: Colors.black87),
                           brightness: Brightness.light,
                     ),
                    body: _isLoading ? Container(
                         child: Center(
                               child: CircularProgressIndicator(),),
                    ): Form(
                         key: _formKey,
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 24),
                               child: Column(children: [
                                    TextFormField(
                                         validator: (val) => val.isEmpty ? "Enter Image Url" : null,
                                         decoration: InputDecoration(
                                               hintText: "Quiz Image Url",
                                         ),
                                        onChanged: (val){
                                           quizImageUrl = val;
                                        },
                                    ),
                                 SizedBox(height: 6,),

                                   TextFormField(
                                   validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
                                   decoration: InputDecoration(
                                     hintText: "Quiz Title",
                                   ),
                                   onChanged: (val){
                                     quizTitle = val;
                                   },
                                 ),
                                 SizedBox(height: 6,),

                                   TextFormField(
                                   validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
                                   decoration: InputDecoration(
                                     hintText: "Quiz Description",
                                   ),
                                   onChanged: (val){
                                     quizDescription = val;
                                   },
                                 ),
                                 Spacer(),
                                 GestureDetector(
                                      onTap: (){
                                        createQuizOnline();
                                      },
                                     child: blueButton(
                                            context: context,
                                            lable: "Create Quiz"
                                     )),
                                 SizedBox(height: 60,),

                                ],),
                      ),
                    ),
    );
  }
}
