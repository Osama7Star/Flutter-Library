import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'components/QouteW.dart';





class Quote extends StatelessWidget {

  final Future<dynamic> function;
   Quote({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 220),
      child: Center(
        child: FutureBuilder(
          future: function,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QuoteModel> list = snapshot.data;
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return QuoteWidget(
                      quoteModel: list[index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }

            ///TODO: MAKE THE PROGRESSBAR IN THE CENTER

            // By default, show a loading spinner.
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator()
              ],
            );
          },
        ),
      )
    );
  }
}


