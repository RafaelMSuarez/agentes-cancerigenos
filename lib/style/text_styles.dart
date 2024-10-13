import 'package:flutter/material.dart';

abstract class TitleTextStyle {
  // Se utiliza en los titulos de las páginas
  static const TextStyle mainTitle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  // Se utiliza en las preguntas frecuentes
  static const TextStyle secondTitle = TextStyle(
    fontSize: 20,
  );
}

abstract class CardTextStyle {
  // Se utiliza en todas las cartas (producto, agente, agentes en producto)
  static const TextStyle mainTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Se utiliza en todas las cartas (producto, agente, agentes en producto)
  static const TextStyle secondTitle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
  );
}

abstract class PopUpTextStyle {
  // Se utiliza en el titulo del popup del agente
  static const TextStyle mainTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  // Se utiliza de titulo en los expandable del popup
  static const TextStyle secondTitle = TextStyle(
    fontSize: 18,
  );

  // Se utiliza para indicar el grupo y en "Publicacion IARC"
  static const TextStyle subtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  // Se utiliza para el contenido de los expandable
  static const TextStyle content = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
}
