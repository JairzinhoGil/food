import 'package:conduit/conduit.dart';
import 'package:food/food.dart';

class FoodController extends ResourceController {
  final _food = [
    {'id': 11, 'name': 'Potato'},
    {'id': 12, 'name': 'Corn'},
    {'id': 13, 'name': 'Flesh'},
    {'id': 14, 'name': 'Sugar'},
    {'id': 15, 'name': 'Salad'},
  ];

  @Operation.get()
  Future<Response> getAllFood() async {
    return Response.ok(_food);
  }

  @Operation.get('id')
  Future<Response> getFoodByID(@Bind.path('id') int id) async {
    final ids = _food.firstWhere((food) => food['id'] == id);

    if (id == ids['id']) {
      return Response.ok(ids);
    } else {
      return Response.notFound();
    }
  }
}
