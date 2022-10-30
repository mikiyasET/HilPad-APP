import 'package:flutter/material.dart';
import 'package:hilpad/constants/colorpalet.dart';


SnackBar errorSnackBar({required String text,required bool isError}){
  return SnackBar(
    content: SizedBox(
      height: 20,
      child: Text(text,style: TextStyle(color: isError ? cError : cSucess)),
    ),
  );
}

customSnackBar(BuildContext context,String data,bool isError){
  ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(text: data,isError: isError));
}