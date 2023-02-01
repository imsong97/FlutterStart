void main() {
  
  // mutable
  var name = "Name"; // 지역변수
  String strName = "strName"; // 전역변수
  
  // immutable
  final String finalStr = "immutable"; // String은 생략 가능

  // dynamic: 타입 체크 => Any
  dynamic dName;
  if(dName is String) {
    
  }
  
  // Nullable
  String? nullableName = "Nullable";
  nullableName = null;
  nullableName?.length;
  
  // late
  late String lateinitStr = "late"; // lateinit var
  late final lazyStr = "lazy"; // val by lazy
  
  // const: should be known at compile-time
  const STR = "const";
  
  // types
  // String / int / bool / double / num => all of them are Object
  // num can be int or double
  
  // list
  var lists = [11,22,33,44];
  List<int> numbers = [1,2,3,4, for(var e in lists) e]; // numbers + lists => [1, 2, 3, 4, 11, 22, 33, 44]
  
  // class
  var player1 = Player("arg 1");
  Player player2 = Player("arg 2");
  Player player3 = Player.namedPlayer1("arg 3")
    ..name = "new Name"; // .. -> kotlin apply
  Player player4 = Player.namedPlayer2("arg 4");
}

// class
class Player {
  String name = "player";
  final int xp = 1500;
  late String arg1;
  
  // constructor
//   Player(String arg1) {
//     this.arg1 = arg1;
//   }
  // or
  Player(this.arg1); // 이 방법은 late 키워드 생략 가능
  
  // named constructor
  Player.namedPlayer1(this.arg1);
  // or
  Player.namedPlayer2(String arg) : this.arg1 = arg, this.name = "named player";
  
  void hello() {
    print("Hello $name");
  }
}

// abstract
abstract class AbstractPlayer {
  void hello();
}

// Enum
enum EnumValue {
  TYPE_A, TYPE_B
}

// Mixin => like interface ??
// but, don't have to override
// be able to multiple inheritance
class LikeInterface {
  String defaultValue = "value";
  void default() {
    print("default method");
  }
}

// Mixin => use with keyword
class ParentClass with LikeInterface {

  // don't need to override
  @override
  void default() {
    print("override default method");
  }
}

void main2() {
  var instance = ParentClass();
  instance.default(); // "override default method"
  instance.defaultValue // "value"
}






















