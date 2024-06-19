typedef FutureStringCallback = Future<String?> Function(String value);
typedef FutureFunctionCallback<T> = Future<T> Function();
typedef FutureFunctionCallback1<T, T1> = Future<T> Function(T1 value);
typedef FunctionCallback<T> = T Function();
typedef FunctionCallback1<T, T1> = T Function(T1 value);
typedef FunctionCallback2<T, T1, T2> = T Function(T1 value1, T2 value2);
typedef ActionCallback<T> = void Function(T value);
typedef ActionCallback2<T1, T2> = void Function(T1 value1, T2 value2);
typedef WillPopDataCallback<T> = Future<bool> Function(T data);