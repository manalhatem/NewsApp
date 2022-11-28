import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_update/views/search.dart';

import '../controllers/cubits.dart';
import '../controllers/states.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCuibt,NewsStates>(
      builder: (context, state) {
      return Scaffold(
       appBar: AppBar(
       title: Row(
         children: [
           IconButton(onPressed: (){
             NewsCuibt.get(context).change();
           }, icon:const Icon(Icons.brightness_4_outlined)),
           IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return SearchScreen();
             }));
           }, icon: const Icon(Icons.search)),

         ],
       ),
       actions:const [
         Padding(
           padding:  EdgeInsets.all(16.0),
           child: Text('News App', style: TextStyle(color: Colors.purple,fontSize: 18),),

         ),
      ],
    ),
      body: NewsCuibt.get(context).screens[NewsCuibt.get(context).currentIndex],
       bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        NewsCuibt.get(context).changeNavBar(index);
      },
      currentIndex: NewsCuibt.get(context).currentIndex ,
      items:const [
        BottomNavigationBarItem(icon:Icon(Icons.business) ,label: 'business'),
        BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
        BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports'),
      ],)
    );
    },);
  }
}