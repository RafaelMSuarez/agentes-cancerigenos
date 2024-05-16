import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // IsarService isar = IsarService();
  // String nombre = "";

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
            // Padding(
            //   padding: EdgeInsets.only(top: alto * 0.05),
            //   child: const Text(
            //     "Cambiar nombre",
            //     style: TitleTheme.mainTitle,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Form(
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //     onChanged: () {
            //       setState(() {
            //         Form.of(primaryFocus!.context!).save();
            //       });
            //     },
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: TextFormField(
            //             decoration: const InputDecoration(
            //               hintText: "Nombre",
            //               prefixIcon: Icon(Icons.person),
            //               contentPadding: EdgeInsets.zero,
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(50),
            //                 ),
            //               ),
            //             ),
            //             textCapitalization: TextCapitalization.words,
            //             onSaved: (newValue) {
            //               if (newValue != null) {
            //                 nombre = newValue;
            //               }
            //             },
            //             validator: (value) {
            //               return (value != null && value.isNotEmpty)
            //                   ? null
            //                   : "Debe ingresar un nombre";
            //             },
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: IconButton(
            //             onPressed: () async {
            //               nombre.isEmpty
            //                   ? null
            //                   : await isar.setName(nombre).then(
            //                         (value) => ScaffoldMessenger.of(context)
            //                             .showSnackBar(
            //                           const SnackBar(
            //                             content: Text("Nombre cambiado"),
            //                           ),
            //                         ),
            //                       );
            //             },
            //             icon: const Icon(Icons.check),
            //             iconSize: 40,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
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
