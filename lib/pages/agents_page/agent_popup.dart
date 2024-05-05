import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentPopUp extends StatefulWidget {
  const AgentPopUp({super.key});

  @override
  State<AgentPopUp> createState() => _AgentPopUpState();
}

class _AgentPopUpState extends State<AgentPopUp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SizedBox(
      height: alto * 0.8,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Nombre Agente",
                style: TitleTheme.mainTitle,
              ),
            ),
            SizedBox(
              width: ancho,
              child: const Center(
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      
                    },
                    title: Text(index.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
