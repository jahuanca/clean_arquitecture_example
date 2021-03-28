import 'package:clean_arquitecture/core/bloc/dimens.dart';
import 'package:clean_arquitecture/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  

  final Size size;
  final String title;
  final void Function() onPressed;
  
  ButtonWidget({this.size, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: primaryColor
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      height: size.height*heightWidgetInput,
      width: double.infinity,
      child: CupertinoButton.filled(
        child: Text(title), onPressed: onPressed)
    );
  }
}