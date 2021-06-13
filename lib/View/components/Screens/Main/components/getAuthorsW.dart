import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/Components/components.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';
class getAuthorsW extends StatelessWidget {
  const getAuthorsW({
    Key key,
    @required AuthorController con3,
  })
      : _con3 = con3,
        super(key: key);

  final AuthorController _con3;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con3.fetchAuthors(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AuthorModel> list = snapshot.data;
          return Container(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio:6.90/ 9.0,
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: MediaQuery
                  .of(context)
                  .orientation == Orientation.portrait ? 2 : 4,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(list.length, (index) {
                return AuthorInfoWidget(authorInfo: list[index],);
              }),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}