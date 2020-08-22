import 'package:TeamPicker/hero_row.dart';
import 'package:flutter/material.dart';
import './alert_dialogs.dart';

class HeroList extends StatefulWidget {
  @override
  _HeroListState createState() => _HeroListState();
}

String getAdress(String name) {
  return 'assets/hero_icons/' + name.replaceAll(' ', '_') + '_minimap_icon.png';
}

class _HeroListState extends State<HeroList> {
  final List<String> listOfHeroes = [
    'Abaddon',
    'Alchemist',
    'Ancient Apparition',
    'Anti-Mage',
    'Arc Warden',
    'Axe',
    'Bane',
    'Batrider',
    'Beastmaster',
    'Bloodseeker',
    'Bounty Hunter',
    'Brewmaster',
    'Bristleback',
    'Broodmother',
    'Centaur Warrunner',
    'Chaos Knight',
    'Chen',
    'Clinkz',
    'Clockwerk',
    'Crystal Maiden',
    'Dark Seer',
    'Dark Willow',
    'Dazzle',
    'Death Prophet',
    'Disruptor',
    'Doom',
    'Dragon Knight',
    'Drow Ranger',
    'Earth Spirit',
    'Earthshaker',
    'Elder Titan',
    'Ember Spirit',
    'Enchantress',
    'Enigma',
    'Faceless Void',
    'Grimstroke',
    'Gyrocopter',
    'Huskar',
    'Invoker',
    'Io',
    'Jakiro',
    'Juggernaut',
    'Keeper of the Light',
    'Kunkka',
    'Legion Commander',
    'Leshrac',
    'Lich',
    'Lifestealer',
    'Lina',
    'Lion',
    'Lone Druid',
    'Luna',
    'Lycan',
    'Magnus',
    'Mars',
    'Medusa',
    'Meepo',
    'Mirana',
    'Monkey King',
    'Morphling',
    'Naga Siren',
    'Nature\'s Prophet',
    'Necrophos',
    'Night Stalker',
    'Nyx Assassin',
    'Ogre Magi',
    'Omniknight',
    'Oracle',
    'Outworld Devourer',
    'Pangolier',
    'Phantom Assassin',
    'Phantom Lancer',
    'Phoenix',
    'Puck',
    'Pudge',
    'Pugna',
    'Queen of Pain',
    'Razor',
    'Riki',
    'Rubick',
    'Sand King',
    'Shadow Demon',
    'Shadow Fiend',
    'Shadow Shaman',
    'Silencer',
    'Skywrath Mage',
    'Slardar',
    'Slark',
    'Snapfire',
    'Sniper',
    'Spectre',
    'Spirit Breaker',
    'Storm Spirit',
    'Sven',
    'Techies',
    'Templar Assassin',
    'Terrorblade',
    'Tidehunter',
    'Timbersaw',
    'Tinker',
    'Tiny',
    'Treant Protector',
    'Troll Warlord',
    'Tusk',
    'Underlord',
    'Undying',
    'Ursa',
    'Vengeful Spirit',
    'Venomancer',
    'Viper',
    'Visage',
    'Void Spirit',
    'Warlock',
    'Weaver',
    'Windranger',
    'Winter Wyvern',
    'Witch Doctor',
    'Wraith King',
    'Zeus'
  ];
  final _saved = Set<String>();
  void onTapHeroRow(String heroName) {
    setState(() {
      if (_saved.contains(heroName))
        _saved.remove(heroName);
      else{
            if (_saved.length == 5)
              return showAlertDialog(context);
            else
              _saved.add(heroName);
          }
    });
  }

  void onHoldHeroRow(String heroName)
  {
    if(heroName == 'Wraith King')
      setState(() {
        return showAlertDialogWK(context);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(18.0),
        itemCount: listOfHeroes.length,
        itemBuilder: (BuildContext context, int index) {
          final alreadySaved = _saved.contains(listOfHeroes[index]);
          return HeroRow(alreadySaved, listOfHeroes[index], onTapHeroRow, onHoldHeroRow);
        });
  }
}

