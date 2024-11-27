import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/data/models/Results.dart';
import 'package:untitled/presentation/widgets/character_item.dart';

import '../../business_logic/cubit/chararters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharartersScreenState();
}

class _CharartersScreenState extends State<CharactersScreen> {
  //late aw ?//
   List<Results>? allCharacters;
   List<Results>? searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters!
        .where((Results) =>
        Results.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {

    });
  }
  List<Widget> _buildAppBarActions(){
    if(_isSearching){
      return [
        IconButton(onPressed: (){
          _clearSearch();
          Navigator.pop(context);
        },
          icon: Icon(Icons.clear,color: MyColors.myGrey,),)
      ];
    }else{
      return[
        IconButton(onPressed: _startSearch, icon: Icon(Icons.search,color: MyColors.myGrey,))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }


  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching= false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
      BlocProvider.of<CharartersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharartersCubit, CharartersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          print('ddddddddddddd${state.characters}');
          allCharacters = state.characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildChararctersList(),
          ],
        ),
      ),
    );
  }

  Widget buildChararctersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty? allCharacters?.length??0 : searchedForCharacters?.length??0,
        itemBuilder: (ctx, index) {
          /// not done
          return CharacterItem(
            characters: _searchTextController.text.isEmpty? allCharacters![index] : searchedForCharacters![index],
          );
        });
  }

  Widget _buildAppBarTittle(){
    return Text('Characters',
    style: TextStyle(color: MyColors.myGrey),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTittle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }





}
