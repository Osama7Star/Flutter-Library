import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Category/components/cateory_list.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';

class getCategoriesW extends StatelessWidget {
  const getCategoriesW({
    Key key,
    @required CategoryController con2,
  })  : _con2 = con2,
        super(key: key);

  final CategoryController _con2;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con2.fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> list = snapshot.data;
          return SizedBox(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 5),
              child: Container(
                child: GridView.count(
                  childAspectRatio: 3.3 / 1,

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,

                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? 2
                      : 4,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(list.length, (index) {
                    return SizedBox(
                      child: category_list(categoryModel: list[index]),
                    );
                  }),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
