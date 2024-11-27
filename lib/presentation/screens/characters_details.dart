import 'package:flutter/material.dart';
import 'package:untitled/constants/my_colors.dart';

import '../../data/models/Results.dart';

class CharactersDetails extends StatelessWidget {
  final Results results;

  const CharactersDetails({super.key, required this.results});

  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          results.name!,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
            tag: results.id!,
            child: Image.network(
              results.image!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  charcterInfo(String title,String value) {
    return RichText(maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
        TextSpan(
            text: value,
            style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
            )
        )
      ]
    ));
  }

  buildDivider(double endIndent) {
    return Divider(color: MyColors.myYellow,
    height: 30,
    endIndent: endIndent,
      thickness: 2,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate([Container(
            margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                charcterInfo("origin", results.origin!.name!.split('/').join(' \n ')),
                buildDivider(315),
                charcterInfo("location", results.location!.url!),
                buildDivider(320),
                charcterInfo("status", results.status!),
                buildDivider(250),
                charcterInfo("gender", results.gender!),
                buildDivider(300),
              ],
            ),
          )]))
        ],
      ),
    );
  }


}
