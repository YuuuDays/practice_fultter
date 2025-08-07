class MyClass{
  // フィールド
  int _a;
  String _b;

  // ゲッター
  int get a => _a;
  String get b => _b;

  // セッター
  set a(int value) => _a = value;
  set b(String value) => _b = value;

  // コンストラクタ　
  // 引数がそのままフィールドに代入される
  MyClass(this._a, this._b);

  // Factoryコンストラクタ
  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(json['a'], json['b']);
  }

  // メソッド
  void printValues() {
    print('a = $_a, b = $_b');
  }

  // staticメンバ
  static int myInt = 20;
  static void myFunc() {
    print('static var is $myInt');
  }
}