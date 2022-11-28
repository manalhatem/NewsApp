import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/cubits.dart';
import '../controllers/states.dart';
import '../widgets/row_article.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCuibt,NewsStates>(
        builder: (context, state)  {
          return state is NewsSportLoading? const Center(child: CircularProgressIndicator(color: Colors.purple,)):
          ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return rowArticle( listItem: NewsCuibt.get(context).sports[index],context: context);
              },
              separatorBuilder: (context,index){
                return Divider();
              },
              itemCount: NewsCuibt.get(context).sports.length);

        }

    );
  }
}