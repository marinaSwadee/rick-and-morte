import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/Results.dart';


class CharacterItem extends StatelessWidget {
  final Results characters;

  const CharacterItem({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetails ,  arguments: characters),
        child: GridTile(child: Hero(
          tag: characters.id!,
          child: Container(
            color: MyColors.myGrey,
            child: characters.image!.isNotEmpty ?
            FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: characters.image!,
            fit: BoxFit.cover,): Image.asset('assets/images/image.jpg')
          ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black,
          alignment: Alignment.bottomCenter,
          child: Text('${characters.name}',style: TextStyle(
            height: 1.3,
            fontSize: 16,
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis, // da y3nii en lwa text gah kbir by7ot .... fe al25r
          maxLines: 2,
          textAlign: TextAlign.center,),
        ),),
      ),
    );
  }
}
