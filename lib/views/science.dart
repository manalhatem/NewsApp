import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_update/controllers/cubits.dart';
import 'package:news_update/controllers/states.dart';

import '../widgets/row_article.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewsCuibt,NewsStates>(
        builder: (context, state)  {
          return state is NewsScienceLoading? const Center(child: CircularProgressIndicator(color: Colors.purple,)):
          ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return rowArticle( listItem: NewsCuibt.get(context).science[index],context: context);
              },
              separatorBuilder: (context,index){
                return Divider();
              },
              itemCount: NewsCuibt.get(context).science.length);

        }

    );
  }
}