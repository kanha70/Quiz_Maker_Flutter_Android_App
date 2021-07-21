  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:flutter/foundation.dart';

   class FancyButton extends StatelessWidget{

      FancyButton({@required this.onPressed});

       final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
           return RawMaterialButton(
               fillColor: Colors.blue,
               splashColor: Colors.orange,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: const <Widget>[
                     RotatedBox(
                       quarterTurns: 4,
                       child: Icon(
                           Icons.explore,
                         ),
                     ),
                     SizedBox(width: 8.0,),
                     Text(
                            "Add New Quiz",
                          style: TextStyle(color: Colors.white)),
                   ],
                 ),
               ),
               onPressed: onPressed,
             shape: const StadiumBorder(),
           );
     }
   }
            //{ class PulseAnimatorState extends StatefulWidget {
  //    //  const PulseAnimatorState({Key? key}) : super(key: key);
  //
  //      @override
  //      _PulseAnimatorStateState createState() => _PulseAnimatorStateState();
  //    }
  //
  //    class _PulseAnimatorStateState extends State<PulseAnimatorState> {
  //      @override
  //      Widget build(BuildContext context) {
  //        return Container();
  //      }
  //    }}
