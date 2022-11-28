import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_update/controllers/cubits.dart';
import 'package:news_update/controllers/states.dart';

import '../widgets/row_article.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

 // TextEditingController searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCuibt,NewsStates>(
      builder: (context, state){
        var list= NewsCuibt.get(context).search;
        return Scaffold(
          appBar: AppBar(title:const Text('Search'),),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  //controller: searchController,
                  // validator: (value){
                  //   if(value!.isEmpty){
                  //     return 'the Search must not empty';
                  //   }
                  // },
                  onChanged: (value){
                    NewsCuibt.get(context).getSearch(value);
                  },
                  decoration:const InputDecoration(
                    label:  Text('Search',style: TextStyle(color: Colors.purple),),
                    prefixIcon: Icon(Icons.search,color: Colors.purple,),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)
                    ),



                  ),
                ),
            state is NewsSearchLoading?Center(child:CircularProgressIndicator()):
            Expanded(
              child: ListView.separated(
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return rowArticle( listItem: list[index],context: context);
                  },
                  separatorBuilder: (context,index){
                    return Divider();
                  },
                  itemCount: list.length),
            )

              ],
            ),
          ),
        );
      },
    );
  }
}
