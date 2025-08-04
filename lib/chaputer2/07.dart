/* 関数定義
戻り値の型　関数名()
 */
import 'dart:async';
//例
void main()
{
  String testFunc ()
  {
    return 'Hello,World!';
  }
  print(testFunc());

  //以下のアロー構文でも定義可能
  void sayHello_wow() => print('Hello aWorld!!');
  sayHello_wow();
  /*非同期処理
  //API通信など非同期な処理を行う関では戻り値がFuture型という型を返す
  Futureの<>に返り値のデータ型を定義し、async/awaitキーワードで完了を待機する処理を定義します。
  */
  String getWeatherFromAPI(n)=>'today is ${10}HARE!!';
  Future<String> callApiFunction(int countryCode)async
  {
    return await getWeatherFromAPI(countryCode);
  }
  //非同期関数の呼び出しでは呼び出し元の関数も非同期関数である必要があります。
  /*
  間違い
  final ansWeather = callApiFunction(10);
  print(ansWeather);　// Instance of 'Future<String>'
  上記だとcallApiFunctionをまたずに返すことになり、Futureインスタンスを返してしまう。
  どうするかというと呼ぶ際の関数にasyncを使い、非同期処理関数前に'await'を入れる
  例:void main() async{...}
  * */
  void callFunc() async{
    final ansWeather = await callApiFunction(10);
    print(ansWeather);
  }
  callFunc();
  //またawait&asyncを使わない場合は以下
  callApiFunction(10).then((ans){
    print(ans);
  });

  // ここで非同期処理練習

  /*
  【問題 1】基本の await
  次の fetchUsername() 関数はユーザー名を返す非同期関数です。
  この関数を使って、ユーザー名を取得して出力してください。
   */
  Future<String> fetchUsername() async {
    return "ユーザーA";
  }
  // ここで fetchUsername() を使って「こんにちは、ユーザーA！」と表示してね
  fetchUsername().then((ansString)=>print('こんにちは、$ansString!'));

  /*【問題 2】Future.delayed を使った遅延API風
    次の関数は2秒後に天気情報を返します。
    「天気を取得中...」と表示 → 天気を表示、という順に出力してください
  */
  Future<String> fetchWeather() async {
    await Future.delayed(Duration(seconds: 2));
    return "晴れ";
  }

  // void ansX()async{
  //   final ans = await fetchWeather();
  //   print(ans);
  // }
  // print('天気を表示中...');
  // ansX();

  /*【問題 3】複数の非同期処理を順番に行う
    次のような2つの非同期処理があります。
    login() → fetchUserData() の順で実行し、ログインとデータ取得のログを出力してください。
  * */
  Future<void> login() async {
    await Future.delayed(Duration(seconds: 1));
    print("ログイン成功");
  }

  Future<String> fetchUserData() async {
    await Future.delayed(Duration(seconds: 1));
    return "ユーザーのプロフィールデータ";
  }

  login();
  fetchUserData().then((n)=>{
    print(n)
  });

  /*【問題 4】then を使って天気を表示（await使わず）
  * */
  print('天気を表示中...');
  fetchWeather().then((n)=>print(n));

  /*【問題 5】try-catch を使ってエラー処理
    次の fetchNews() 関数は失敗する可能性があります。
    try-catch を使って、「ニュースを取得できませんでした」と表示してください
  */
  Future<String> fetchNews() async {
    throw Exception("ネットワークエラー");
  }

  Future<void> ansNew()async
  {
    try
    {
      final result = await fetchNews();
      print('ここは(今回)表示されないけど一応:$result');
    } on Exception catch (e) {
      print('エラーが発生しました：ニュースを取得できませんでした');
      print(e);
    }
  }
  void callFunc_X()async{
    ansNew();
  }
  callFunc_X();

}

