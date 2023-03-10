import 'package:assignment/constants.dart';
import 'package:assignment/cubits/timer%20cubit/app%20cubit/app_cubit.dart';
import 'package:assignment/cubits/timer%20cubit/timer_cubit.dart';
import 'package:assignment/cubits/timer%20cubit/timer_states.dart';
import 'package:assignment/models/question_model.dart';
import 'package:assignment/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  List<QuestionModel> question = AppBloc().questions;
  List<QuestionModel> answers = question.shuffle();
  final int score;
  const Home({ Key? key , required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        body: SafeArea(child: 
        BlocBuilder<TimerCubit,TimerStates>(
          builder: (context,state){
           if(state is TimerInit){
              return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15),
              child: Container(
                height: 120,
                width: 500,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Score : ${score} + ${state.elapsed}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red
                        ),
                      ),
                      Text('',
                       textAlign: TextAlign.right,),
                      Text('',
                       textAlign: TextAlign.right,)
                    ],
                  ),
                ),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                     color: Colors.orange
                  )
                ),
              )
              ),
              if ()
             Row(
               children: [
                 Spacer(),
                 Column(
                   children: question.map((item){
                     return Container(
                       decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                     color: Colors.orange
                  )
                ),
                       margin: EdgeInsets.all(8),
                       child: Draggable<QuestionModel>(
                         data: item,
                         childWhenDragging: Container(height: 100,
                           width:100,
                             child: Text(item.title)
                           ),
                         feedback:Container(height: 100,
                           width:100,
                             child:Text(item.title) 
                           ),
                           child: Container(height: 100,
                           width:100,
                             child: Text(item.title)
                           ),
                       ),
                     );
                   }).toList(),
                 ),
                 Spacer(flex: 2,),
                 if(answers != null)
                 Column(
                   children: answers.map((item2){
                     return DragTarget<QuestionModel>(
                       onAccept: (receivedItem){
                         if(item2.answer == receivedItem.answer){
                           
                             question.remove(receivedItem);
                             answers.remove(item2);
                             score = score! + 1;
                          
                         }
                         else{
                            score = score! - 5;
                         }
                       },
                       onWillAccept: (receivedItem){
                         return true;
                       },
                       onLeave: (receivedItem){
                       builder: (context , acceptedItems, rejectedItems){
                         return Container(decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                     color: Colors.orange
                  )
                ),margin: EdgeInsets.all(8),
                           child:  Container(height: 100,
                           width:100,
                             child: Text(answers.answer),
                           )
                           
                         );
                       },
                     );
                   }).toList(),
                 ),
                 Spacer(),
                 if()
                 Center(
                   child: Column(
                     children: [
                       Padding(padding: const EdgeInsets.all(8),
                       child: Text('Game Over',
                       style: Theme.of(context).textTheme.headline6!.copyWith(
                         fontWeight: FontWeight.bold,
                         color : Colors.red
                       )),),
                       Padding(padding: EdgeInsets.all(8),
                       child: Text('',
                       style: Theme.of(context).textTheme.headline3,),)
                     ],
                   ),
                 ),
                 if(gameover)
                 Container(
                   height: MediaQuery.of(context).size.width / 10,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8)
                   ),
                   color: Colors.teal,
                   child: TextButton(child: Text('Try Again',
                   style: TextStyle(
                     color: Colors.white
                   ),),
                   onPressed: (){
                   },),
                 )
               ],
          ),]
          )))
      
    );
            }
            
          if(state is TimerProgress){
            return Center(child:Text('${state.elapsed!}'));
            navigateAndFinish(context, Welcome());
          }
          return Container();}
        )),
      ),
    );
  }
}