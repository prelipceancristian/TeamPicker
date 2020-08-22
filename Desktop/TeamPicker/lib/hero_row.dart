import 'package:flutter/material.dart';

String getAdress(String name) {
  return 'assets/hero_icons/' + name.replaceAll(' ', '_') + '_minimap_icon.png';
}

class HeroRow extends StatefulWidget {
  final bool alreadySaved;
  final String heroName;
  final Function onTapHeroRow;
  final Function onHoldHeroRow;

  HeroRow(this.alreadySaved, this.heroName, this.onTapHeroRow, this.onHoldHeroRow);

  @override
  _HeroRowState createState() => _HeroRowState();
}

class _HeroRowState extends State<HeroRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.heroName),
      leading: Image.asset(
        getAdress(widget.heroName),
      ),
      trailing: Icon(
        widget.alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: widget.alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        widget.onTapHeroRow(widget.heroName);
      },
      onLongPress: () {
        widget.onHoldHeroRow(widget.heroName);
      },
    );
  }
}
