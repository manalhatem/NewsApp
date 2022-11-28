import 'package:flutter/material.dart';

Widget rowArticle({required listItem,required context}){
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image:  DecorationImage(image: NetworkImage(
                  '${listItem['urlToImage'] ?? 'https://neurosciencenews.com/files/2022/11/octopus-brain-neurosicences-.png' }'),
              fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 20,),
          Container(
            height: 140,
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text('${listItem['title']}',
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyText1,
                   overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${listItem['publishedAt']}',style:const TextStyle(color: Colors.black38,fontSize: 12),)
              ],
            ),
          ),
        ],
      ),
    );
}