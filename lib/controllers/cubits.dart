import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';
import '../network/remote/dio_helper.dart';
import '../views/business.dart';
import '../views/science.dart';
import '../views/settings.dart';
import '../views/sports.dart';
import 'states.dart';


class NewsCuibt extends Cubit<NewsStates>{
  NewsCuibt():super(InitialNews());

  static NewsCuibt get(context)=> BlocProvider.of(context);

  List<String> titles=[
    'Business News',
    'Science News',
    'Sports News'
  ];
  List<Widget> screens=[
   const BusinessScreen(),
   const ScienceScreen(),
   const SportsScreen(),
   const SettingsScreen()
  ];
  int currentIndex=0;

  changeNavBar(int index){
    currentIndex=index;
    if(index==1){
      getScience();
    }
    if(index==2){
      getSports();
    }
    emit(NewsBottomStates());

  }
 bool changeTheme= false;
 void change()
  {
    changeTheme=!changeTheme;
    emit(ChangeTheme());
    //CacheHelper.saveDate(key: 'isDark', value: changeTheme).then((value) {});

  }
List<dynamic> business=[];

  getBusiness()async{
    emit(NewsBusinessLoading());
  await DioHelper.getData(
    url: baseUrl,
     query: {
    'country':'eg',
    'category':'business',
    'apiKey':apiKey,
  }).then((value) {
    //print(value.data['articles'][0]['title']);
    business= value.data['articles'];
    emit(NewsBusinessSuccess());
  }).catchError((error){
    //print(error.toString());
    emit(NewsBusinessError(error.toString()));
  })
  ;
 }
 List sports=[];

  getSports()async{
    emit(NewsSportLoading());
    await DioHelper.getData(url: baseUrl, query: {
      'country':'eg',
      'category':'sports',
      'apiKey':apiKey,
    }).then((value) {
      sports=value.data['articles'];
      emit(NewsSportSuccess());

    }
    ).catchError((error){
      emit(NewsSportsError(error));
    });

  }

  List science=[];
  getScience()async{
    emit(NewsScienceLoading());
    await DioHelper.getData(url: baseUrl, query:{
    'country':'eg',
    'category':'science',
      'apiKey':apiKey,
    }).then((value) {
      science=value.data['articles'];
    }).catchError((onError){
      emit(NewsScienceError(onError));
    });
  }


  List search=[];
  void getSearch( String value)async{
    emit(NewsSearchLoading());
    await DioHelper.getData(url: 'v2/everything', query: {
      'q':value,
      'apiKey':apiKey,

    }).then((value) {
      search=value.data['articles'];

    }).catchError((onError){
      emit(NewsSearchError(onError));
    });



  }




  
}