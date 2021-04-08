
import 'package:http/http.dart' as http;

Future<http.Response> fetchCategoriesR() async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getcategories?access-token=test");
  return response ;

}

