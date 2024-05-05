import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProfilePage extends StatefulWidget {
  final String nombre;
  const ProfilePage({super.key, required this.nombre});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: PaddingTheme.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: alto * 0.05),
              child: const Text(
                "Cambiar nombre",
                style: TitleTheme.mainTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check),
                      iconSize: 40,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                color: Colors.grey[300],
                height: alto * 0.2,
                width: ancho,
                child: const Text("links información"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                color: Colors.grey[300],
                height: alto * 0.35,
                width: ancho,
                child: const Text("informacion app y creditos"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
