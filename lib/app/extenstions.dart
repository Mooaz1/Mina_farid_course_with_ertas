
extension NoNullString on String?{
  String orEmpty(){
    if (this==null) {

      return "";
      
    }
    return this!;
  }
}

extension NoNullInt on int?{
  int orZero(){
    if (this==null) {

      return 0;
      
    }
    return this!;
  }
}

