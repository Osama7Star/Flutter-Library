import 'package:flutter/material.dart';
import 'package:flutter_library_new/components/components.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar11(context),
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              height: 200,
              child: CircleAvatar(
                radius: 0,
                backgroundImage: NetworkImage(
                    'https://qph.fs.quoracdn.net/main-qimg-134e3bf89fff27bf56bdbd04e7dbaedf.webp'
                ),

              ),

            ),
            SizedBox(height: 10,),

            SubText(text: "محمد علي", textSize: 24),
            SizedBox(height: 5,),

            SubText(text: "جامعة إسطنبول", textSize: 16,color: Colors.black,),
            SizedBox(height: 5,),

            SubText(text: "كلية الحاسوب", textSize: 16,color: Colors.black),


          ],
        ),
      )
    );
  }
}
