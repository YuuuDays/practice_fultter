const int number = 150;
// words = myFunction();

void main()
{
  String moji = '文字列は基本的にシングルクォーテーション';
  // const List<>fruits=['りんご','ごりら']; 左<>の中を空にはできない。型予想できないならdynamicをいれよう

  // String moji = '文字列は基本的にシングルクォーテーション';
  // const List<dynamic>fruits=['りんご','ごりら',moji];
  // 上記でエラーになる理由はconstで宣言しているリストに文字列を入れている為(定数ではない)
  // つまり修正するには以下のようにfinalを使うか、Stringもconstを使う

  // finalは実行時に一度だけ、一般的にはユーザ入力や日付
  // constはコンパイル時に確定、一般的には数字や固定テキストを入れる
  final List<dynamic> fruits = ['りんご','ごりら',moji];
  print(fruits);

  //List,Set,Mapでは格納するデータ型を<>で囲って定義する
  const Set<int> contryCode = {1,88,44};

  final Map<String,int> students= {'佐藤':20,'田中太郎':100};
  print(contryCode);
  print(students);
  print(students['佐藤']);

}