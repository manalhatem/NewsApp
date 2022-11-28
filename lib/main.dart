import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'controllers/cubits.dart';
import 'controllers/states.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'views/navbar.dart';

void main() {

 // WidgetsFlutterBinding.ensureInitialized();
 // await  CacheHelper.init();
   Bloc.observer = MyBlocObserver();
   DioHelper.init();


  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // bool isDark= CacheHelper.getData(key: 'isDark');
    return BlocProvider(
      create: (context) =>NewsCuibt()..getBusiness(),
      child: BlocBuilder<NewsCuibt,NewsStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode:NewsCuibt.get(context).changeTheme?ThemeMode.dark:ThemeMode.light,
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.white70,fontWeight: FontWeight.w600)
              ),
              scaffoldBackgroundColor:const Color(0xffa8a59f),
              appBarTheme:const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.purple),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  backgroundColor: Color(0xffa8a59f),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                backgroundColor: Color(0xffa8a59f),
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedItemColor: Colors.deepPurple,
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
              ),

            ),
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.purple),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.light
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedItemColor: Colors.deepPurple,
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
              ),


            ),
            home: const Directionality(textDirection: TextDirection.rtl,
                child: BottomNavBar()),
          );
        }

      ),
    );
  }
}
