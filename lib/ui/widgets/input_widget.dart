import 'package:clean_arquitecture/core/bloc/dimens.dart';
import 'package:clean_arquitecture/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  
  final Size size;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditingController;
  
  InputWidget({this.size, this.placeholder, this.icon, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: borderWidgetColor
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      height: size.height*heightWidgetInput,
      child: Row(
        children: [
          Flexible(child: Container(
            child: Center(child: CircleAvatar(child: Icon(icon))),
          ), flex: 1,),
          Flexible(child: Container(
            
            child: CupertinoTextField(
              placeholder: placeholder,
              decoration: null,
              controller: textEditingController,
              padding: EdgeInsets.only(
                right: size.width*0.14
                
                ),
              textAlign: TextAlign.center,
              placeholderStyle: TextStyle(
              ),
            ),
          ), flex: 3,),
        ],
      ),
    );
  }
}