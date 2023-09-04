
abstract class Bloc {
  ///Initializes anything inside the bloc necessary to run the business logic.
  Future initialize(){
    throw Exception();
  }
  ///Dispose the bloc resources
  void dispose();
}