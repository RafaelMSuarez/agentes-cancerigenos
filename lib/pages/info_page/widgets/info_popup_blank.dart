import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class BlankPopUp extends StatelessWidget {
  const BlankPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.7,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text(""),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "",
              style: PopUpTextStyle.content,
            ),
          ),
        ],
      ),
    );
  }
}
