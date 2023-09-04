
abstract class Bloc {
  ///Initializes anything inside the bloc necessary to run the business logic.
  Future initialize();
  ///Dispose the bloc resources
  void dispose();
}