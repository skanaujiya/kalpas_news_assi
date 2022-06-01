import 'package:flutter/material.dart';

SizedBox CustomButton(BuildContext context,String name,Function onTap){
  return SizedBox(
    width: 200,
    height: 50,
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(name,
        style:  const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
        ),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ))
      ),
    ),
  );
}