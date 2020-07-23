// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

Future<String> loadAsset() async {
  var s =  await rootBundle.loadString('assets/hero_names.txt');
  print(s);//for debug
  return s;
}

readFromFile()
{
  File file = new File("assets/hero_names.txt");
  String content = file.readAsStringSync();
  //print(content);
  return " ";
}

String convertName(String name)
{
  return name.replaceAll(" ", "_");
} 

String generatePath(String heroName)
{
  String path  =  "assets/hero_icons/" + convertName(heroName) + "_minimap_icon.png";
  return path;
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Dota 2 Team Generator',
      theme: ThemeData(
        primaryColor: Colors.red[700],
      ),
      home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //@override


  final _saved = Set<String>();
  final listOfHeroNames = ['Abaddon', 'Alchemist', 'Ancient Apparition', 'Anti-Mage', 'Arc Warden', 'Axe', 'Bane', 'Batrider', 'Beastmaster', 'Bloodseeker', 'Bounty Hunter', 'Brewmaster', 'Bristleback', 'Broodmother', 'Centaur Warrunner', 'Chaos Knight', 'Chen', 'Clinkz', 'Clockwerk', 'Crystal Maiden', 'Dark Seer', 'Dark Willow', 'Dazzle', 'Death Prophet', 'Disruptor', 'Doom', 'Dragon Knight', 'Drow Ranger', 'Earth Spirit', 'Earthshaker', 'Elder Titan', 'Ember Spirit', 'Enchantress', 'Enigma', 'Faceless Void', 'Grimstroke', 'Gyrocopter', 'Huskar', 'Invoker', 'Io', 'Jakiro', 'Juggernaut', 'Keeper of the Light', 'Kunkka', 'Legion Commander', 'Leshrac', 'Lich', 'Lifestealer', 'Lina', 'Lion', 'Lone Druid', 'Luna', 'Lycan', 'Magnus', 'Mars', 'Medusa', 'Meepo', 'Mirana', 'Monkey King', 'Morphling', 'Naga Siren', 'Nature\'s Prophet', 'Necrophos', 'Night Stalker', 'Nyx Assassin', 'Ogre Magi', 'Omniknight', 'Oracle', 'Outworld Devourer', 'Pangolier', 'Phantom Assassin', 'Phantom Lancer', 'Phoenix', 'Puck', 'Pudge', 'Pugna', 'Queen of Pain', 'Razor', 'Riki', 'Rubick', 'Sand King', 'Shadow Demon', 'Shadow Fiend', 'Shadow Shaman', 'Silencer', 'Skywrath Mage', 'Slardar', 'Slark', 'Snapfire', 'Sniper', 'Spectre', 'Spirit Breaker', 'Storm Spirit', 'Sven', 'Techies', 'Templar Assassin', 'Terrorblade', 'Tidehunter', 'Timbersaw', 'Tinker', 'Tiny', 'Treant Protector', 'Troll Warlord', 'Tusk', 'Underlord', 'Undying', 'Ursa', 'Vengeful Spirit', 'Venomancer', 'Viper', 'Visage', 'Void Spirit', 'Warlock', 'Weaver', 'Windranger', 'Winter Wyvern', 'Witch Doctor', 'Wraith King', 'Zeus'];
  //List<String> listOfHeroNames = loadAsset().then();
  final _biggerFont = TextStyle(fontSize: 20.0);
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: EdgeInsets.all(18.0),
      itemCount: listOfHeroNames.length,
      itemBuilder: (context, index) {
        return _buildRow(listOfHeroNames[index]);
      });
}
Widget _buildRow(String heroName) {
  
  final alreadySaved = _saved.contains(heroName);
  return ListTile(
    leading: Image.asset(generatePath(heroName)),
    title: Text(
      heroName,
      style: _biggerFont,
    ),
    trailing: Icon(
       alreadySaved ? Icons.favorite : Icons.favorite_border,
       color: alreadySaved ? Colors.red : null,
    ),
    onTap: () {
      setState(() {
        if(alreadySaved)
        _saved.remove(heroName);
        else
        {
        if(_saved.length == 5)
        return showAlertDialog(context);
        else
        _saved.add(heroName);
        }

      });
    },
    onLongPress: ()
    {
      if(heroName == "Wraith King")
      {
        setState(() {
          return showAlertDialogWK(context);
        });
      }
      else
        setState(() {
          if(alreadySaved)
            _saved.remove(heroName);
          else
          {
            if(_saved.length == 5)
            return showAlertDialog(context);
            else
            _saved.add(heroName);
          }
        });
    },
  );
}
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Dota 2 Team Generator'),
      actions: [
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
      ]
    ),
    body: _buildSuggestions(),
  );
  }
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (String heroName) {
              return ListTile(
                leading: Image.asset(generatePath(heroName)),
                title: Text(
                  heroName,
                  style: _biggerFont,
                ),
                trailing: IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
              );
            },
          );
          final divided = ListTile.divideTiles(
            
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Heroes'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK",style: TextStyle(color: Colors.red[700], fontSize: 16.0)),
    onPressed: () {Navigator.pop(context); },
    //padding: EdgeInsets.only(top:50.0)
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hold up there, bud!", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("A Dota 2 team has only five heroes. ", style: TextStyle(fontSize: 18.0),),
        okButton    
    ],

    ),
    elevation: 24.0,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}

showAlertDialogWK(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("No, take me back...",style: TextStyle(color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic )),
    onPressed: () {Navigator.pop(context); },
    //padding: EdgeInsets.only(top:50.0)
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("YOU DARE TOUCH THE SKELETON KING, MORTAL?", 
      textAlign: TextAlign.center, 
      style: GoogleFonts.ranchers(
        textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900)),
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset("assets/hero_icons/Skeleton_King_Art.jpg"),
        okButton    
    ],

    ),
    elevation: 24.0,
    backgroundColor: Colors.red[900],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}

