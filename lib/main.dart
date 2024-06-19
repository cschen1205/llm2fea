import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'my_custom_scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GenApp());
}

class GenApp extends StatelessWidget {
  const GenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: false,
          ),
          title: 'LLM2FEA',
          // You can use the library anywhere in the app even in theme
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // ),
          builder: EasyLoading.init(
              builder: (context, child) {
                return Scaffold(body: InkWell(
                    child: child,
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                    }
                ));
              }
          ),
          home: child,
          locale: const Locale('en'),
        );
      },
      child: HomePage(),
    );
  }
}
