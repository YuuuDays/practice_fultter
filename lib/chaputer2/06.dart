const int number = 150;
// words = myFunction();

void main() {
  String moji = '文字列は基本的にシングルクォーテーション';
  // const List<>fruits=['りんご','ごりら']; 左<>の中を空にはできない。型予想できないならdynamicをいれよう

  // String moji = '文字列は基本的にシングルクォーテーション';
  // const List<dynamic>fruits=['りんご','ごりら',moji];
  // 上記でエラーになる理由はconstで宣言しているリストに文字列を入れている為(定数ではない)
  // つまり修正するには以下のようにfinalを使うか、Stringもconstを使う

  // finalは実行時に一度だけ、一般的にはユーザ入力や日付
  // constはコンパイル時に確定、一般的には数字や固定テキストを入れる
  final List<dynamic> fruitsB = ['りんご', 'ごりら', moji];
  print(fruitsB);

  //List,Set,Mapでは格納するデータ型を<>で囲って定義する
  const Set<int> contryCode = {1, 88, 44};

  final Map<String, int> students = {'佐藤': 20, '田中太郎': 100};
  print(contryCode);
  print(students);
  print(students['佐藤']);

  //dartでは、関数そのものを変数に入れることが出来る。
  String myTestFunc(int x) {
    return '恐らくこれは$xですね。';
  }
  final String Function(int) myFunc = myTestFunc;
  print(myFunc(10));

  int mineTestFunc(String y) {
    return 99999;
  }
  final int Function(String) mineFunc = mineTestFunc;
  print(mineFunc('にょわぁ'));

  //応用(無名関数)
  /*
   無名関数の基本形（Dart）
   ①
   (引数) {
  // 処理
  return 値;
   }
   ②
   (引数) => 式;
   */
  print("=========================================================");
  //【問題1】printを使ってリストの中身を全部出力せよ
  final fruits = ['りんご', 'みかん', 'バナナ'];
  fruits.forEach((n) => print(n));

  //【問題2】リストの数字を2倍にして出力しよう
  final numbers = [1, 3, 5];
  numbers.forEach((n) => print(n * 2));
  // 【問題3】関数に無名関数を引数として渡して使ってみよう
  // この関数 repeat3Times を使って、「こんにちは！」を3回表示させてください。
  void repeat3Times(void Function() action) {
    for (int i = 0; i < 3; i++) {
      action();
    }
  }
  repeat3Times(() => print('こんにちは！'));

  //【問題4】数字を引数に取る無名関数を渡そう
  // これを使って「10 を受け取って、その2乗を表示する無名関数」を渡してください。
  void runWithNumber(void Function(int) action) {
    action(10);
  }
  runWithNumber((n) {
    print(n * n);
  });

  // 問題5：以下のような関数を作成して、偶数だけを出力してください。
  void filterAndPrint(List<int> list, bool Function(int) condition) {
    for (var n in list) {
      if (condition(n)) {
        print(n);
      }
    }
  }

  final nums = [1, 2, 3, 4, 5, 6];

  // ここに、偶数だけ出力するように filterAndPrint を呼び出してください
  filterAndPrint(nums, (n) {
    if (n % 2 == 0) {
      return true;
    }
    return false;
  });
}
