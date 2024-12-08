import 'package:proyecto_ubb/models/agent_model.dart';

// Se incluye este archivo en caso de no contar con la versión de Firebase
// Esto incluye la misma base de datos, pero de manera offline, y ajustada al modelo de datos de la app

// En caso de subir ésta información a otra base de datos, tener cuidado con el regex
// Especificamente, con los \" y con los salto de linea

List<Agent> agentesCarcinogenicos = [
  Agent(
      pubChemId: 13506,
      agent: "Amaranto",
      group: 4,
      volumen: "8, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Colorante sintético de color rojizo a morado. Se suele utilizar como colorante en algunas comidas, textiles, cueros, maderas y papeles. Se obtiene como derivado del naftaleno (naftalina).",
      infoHumanos:
          "*No existe evidencia ni datos* para determinar su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*No existe evidencia adecuada* para determinar su carcinogenicidad en *animales*.",
      addInfo:
          "No se encuentra prohibido ni regulado según el RSA, en Chile. No confundir con el género de plantas *Amaranthus*",
      tags: "e123, e 123, amaranth, rojo acido 27, rojo 9"),
  Agent(
      pubChemId: 17730,
      agent: "Amarillo Crepúsculo FCF",
      group: 4,
      volumen: "8, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Colorante sintético, de color naranja claro. Se obtiene como derivado del petróleo. Es frecuente su combinación con otros colorantes, para obtener un color marrón.",
      infoHumanos:
          "*No existe evidencia* sobre su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*No existe evidencia* sobre su carcinogenicidad en *animales*.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags: "E110, e 110, amarillo 6"),
  Agent(
      pubChemId: 134601,
      agent: "Aspartamo",
      group: 3,
      volumen: "134",
      yearPub: 2024,
      yearEv: 2023,
      descInfo:
          "Edulcorante utilizado principalmente en comidas y bebidas, como alternativa a la ázucar.",
      infoHumanos:
          "*Existe limitada evidencia* sobre la carcinogenicidad en humanos del aspartamo. *Existen observaciones positivas* entre el aspartamo y el carcinoma hepatocelular (cáncer de hígado).",
      infoAnimales: "",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags: "aspartamo, aspartame, e951, e 951, e-951"),
  Agent(
      pubChemId: 19118,
      agent: "Azorrubina",
      group: 4,
      volumen: "8, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Colorante sintetico derivado del petróleo. Posee una tonalidad rojo marrón.",
      infoHumanos:
          "*No existe evidencia* ni datos sobre su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*La evidencia* sugiere que *no es un carcinogénico* para *animales*.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags: "E122, carmoisina, carmoisine, rojo 5, Red 5"),
  Agent(
      pubChemId: 19700,
      agent: "Azul Brillante FCF",
      group: 4,
      volumen: "16, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Colorante sintético de color azul. Se obtiene como derivado del petróleo.",
      infoHumanos:
          "*No existe evidencia* ni datos sobre su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* para su carcinogenicidad en ratones de laboratorio. Aumenta la posibilidad de cáncer de riñón.",
      addInfo:
          "Permitido su uso en Chile, con restricción en acorde con RSA. Puede provocar intolerancias a personas con alergias al ácido salicílico.",
      tags: "E133, azul brillante fcf, brilliant blue fcf"),
  Agent(
      pubChemId: 0,
      agent: "Beber Café",
      group: 4,
      volumen: "51, 116",
      yearPub: 2018,
      yearEv: 2016,
      descInfo: "Acción de beber café.",
      infoHumanos:
          "*Existe evidencia* que sugiere una *falta de carcinogenicidad*, en el consumo de café, en cáncer de páncreas, higado, mamas, endometrio uterino y próstata. Asosiaciones inversas se han observado en cáncer del hígado y endometrio uterino.",
      infoAnimales: "null",
      addInfo:
          "Se considera también dentro de \"bebidas calientes\" , por ende, a *altas temperaturas*, se considera en el grupo 2A (Quemaduras de esófago)",
      tags: "coffees, coffee, instant-coffees, coffee-drinks, café"),
  Agent(
      pubChemId: null,
      agent: "Bebidas Alcohólicas",
      group: 1,
      volumen: "44, 96, 100E",
      yearPub: 2012,
      yearEv: 2009,
      descInfo:
          "Cualquier bebida que contenga una graduación alcohólica mayor a 0.5°",
      infoHumanos:
          "*Existe suficiente evidencia* en humanos de la carcinogenicidad del alcohol en *humanos*. El consumo de alcohol causa cánceres de boca, faringe, laringe, esófago, colorrectal, hígado (carcinoma hepatocelular) y de mamas femeninas. También existe asociación con el cáncer del páncreas. *Existe suficiente evidencia* de la carcinogenicidad del acetaldehído en los humanos, asociado con el consumo de bebidas alcohólicas.",
      infoAnimales:
          "*Existe suficiente evidencia* de la carcinogenicidad del alcohol y etanol en *animales*.",
      addInfo:
          "Al consumir bebidas alcohólicas, el cuerpo lo convierte el alcohol en acetaldehído, el cual daña las células, evitando la reparación de estas, facilitando el cáncer.",
      tags: "alcoholic-beverages, wines, beers"),
  Agent(
      pubChemId: 0,
      agent: "Bebidas Calientes (+65°C)",
      group: 2,
      volumen: "116",
      yearPub: 2018,
      yearEv: 2016,
      descInfo:
          "Cualquier bebestible que se bebe a una temperatura mayor a 65°C, provocando quemaduras en las paredes del esófago. Generalmente, se sopla, o se deja enfriar una bebida caliente a una temperatura adecuada, evitando quemaduras.",
      infoHumanos:
          "*Existen limitadas evidencias* que el beber bebidas muy calientes sea carcinogénico para humanos. Existen asociaciones positivas entre el beber bebidas calientes y el cáncer de las celulas escamosas en el esófago.",
      infoAnimales: "null",
      addInfo:
          "*No existe evidencia adecuada* para cuando se beben por debajo de los 65°C, por ende se recomienda no beber liquidos mientras hierven.",
      tags:
          "coffees, hot-beverages, teas, herbal-teas, café, té, té negro, mate"),
  Agent(
      pubChemId: 23673461,
      agent: "Bromato de Potasio",
      group: 3,
      volumen: "Sup 7, 73",
      yearPub: 1999,
      yearEv: 1998,
      descInfo:
          "Utilizado anteriormente como potenciador de harina y en la producción de cerveza de malta.",
      infoHumanos:
          "*No existe evidencia adecuada* de su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* para determinar su carcinogenicidad en *animales*. En ratas y hámsters produce tumores renales.",
      addInfo:
          "Prohibido su uso en Europa, Canadá, Sudamérica (incluye Chile), Sri Lanka, China y Nigeria. Permitido en Estados Unidos, bajo restricciones y, en California, con uso de etiqueta especial de presencia de bromatos. A pesar de estar prohibido su uso en Chile (en acorde con el RSA) su venta aún se encuentra disponible.",
      tags:
          "potassium bromate, e924a, e 924 a, e-924a, e-924 a, bromato de potasio"),
  Agent(
      pubChemId: 24667,
      agent: "Butil hidroxianisol (BHA)",
      group: 3,
      volumen: "40, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Aditivo alimentario conservador. Contiene antioxidantes, lo que previene el enranciamiento de los alimentos con materias grasas.",
      infoHumanos:
          "*No existe información disponible* para determinar su carcinogenicidad en *humanos*. Esto ya que no se han llevado estudios experimentales en humanos. Por ende, se recomienda (según IARC), considerar estudios sin información en humanos, pero con suficiente evidencia en animales, como *evidencia para carcinogenicidad en humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* para determinar su carcinogenicidad en *animales*.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags:
          "bha, e320, e-320, e 320, hidroxianisol, butil-hidroxi-anisol, butil hidroxianisol, butylated hydroxyanisole"),
  Agent(
      pubChemId: 31404,
      agent: "Butil hidroxitolueno (BHT)",
      group: 4,
      volumen: "40, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Aditivo alimentario antioxidante, utilizado para ayudar a preservar y estabilizar sabor, color, frescura y aporta nutricional de alimentos de humanos y animales.",
      infoHumanos:
          "*No existe documentacion* de carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe evidencia limitada* para carcinogenicidad en *animales*.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags:
          "Butilhidroxitolueno, bht, e321, e-321, e 321, Butil hidroxitolueno, Butylated hydroxytoluene, Antioxidant 264"),
  Agent(
      pubChemId: 2519,
      agent: "Cafeína",
      group: 4,
      volumen: "51",
      yearPub: 1991,
      yearEv: 1990,
      descInfo:
          "Activo químico principal del café. Se encuentra, igualmente, en otras bebidas y alimentos como el té, mate, dulces, gaseosas y bebidas energéticas.",
      infoHumanos:
          "*No existe evidencia adecuada* de su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*No existe evidencia adecuada* de su carcinogenicidad en *animales*.",
      addInfo:
          "A bajas dosis, la cafeína estimula el sistema nervioso central. A mayores concentraciones produce inquietud, agitación, temblores, tinnitus, dolor de cabeza e insomnio. También puede causar alteraciones en los ciclos de sueño y emocionales, aumento de la producción de orina y secreción de ácidos gástricos.",
      tags:
          "coffees, teas, cafeína, cafeina, caffeine, instant-coffees, coffee-drinks, café"),
  Agent(
      pubChemId: 0,
      agent: "Carnes Rojas",
      group: 2,
      volumen: "114",
      yearPub: 2018,
      yearEv: 2015,
      descInfo:
          "Las carnes rojas refieren a la carne del músculo fresco sin procesar de animales como ganado vacuno, cerdos, cordero, caballos o cabras. Su consumo suele ser cocinado. Se puede presentar fresca, molida o congelada.",
      infoHumanos:
          "*Existe limitada evidencia* de su carcinogenicidad en* humanos*. *Asociaciones positivas* entre el consumo de carnes rojas y los cánceres de próstata, colorrectal y pancreas han sido determinadas. Al momento de quemarse la carne en exceso (carbonizado) se generan químicos llamados hidrocarburos aromáticos policíclicos. Estos se han demostrados como tóxicos para el consumo humano.",
      infoAnimales:
          "*No existe evidencia adecuada* para determinar su carcinogenicidad en *animales*.",
      addInfo:
          "Si va a consumir carnes rojas, se recomienda su consumo cocinado, procurando no quemar (carbonizar) el exterior de la carne, debido a la creación de hidrocarburos aromáticos policíclicos (HAP o PAH).",
      tags:
          "red-meats, meats-and-their-products, cooked-meats, beef-meat, beef"),
  Agent(
      pubChemId: 0,
      agent: "Carnes procesadas",
      group: 1,
      volumen: "114",
      yearPub: 2018,
      yearEv: 2015,
      descInfo:
          "Carnes procesadas refiere a cualquier carne que ha sido transformada a través de uno o más procesos, tales como: salazón, curado, fermentación, ahumado y otros procesos para aumentar su sabor o conservación.",
      infoHumanos:
          "*Existe suficiente evidencia* de su carcinogenicidad en *humanos*. El consumo de carnes procesadas causa cáncer colorrectal. *Existen asociaciones positivas* entre el consumo de carnes procesadas y el cáncer de estómago. Esto se debe al número de aditivos en estos productos, tales como nitratos y nitritos, al igual que los químicos causados al quemar y ahumar la carne (HCA y PCA)",
      infoAnimales:
          "*No existe evidencia adecuada* para determinar su carcinogenicidad en *animales*.",
      addInfo: "null",
      tags:
          "prepared-meats, hams, cured-meats, meats-and-their-products, cured-sausages, sausages, salami"),
  Agent(
      pubChemId: 23665706,
      agent: "Ciclamato Sódico",
      group: 4,
      volumen: "Sup 7, 73",
      yearPub: 1999,
      yearEv: 1998,
      descInfo:
          "Edulcorante sintético bajo en calorías. Es hasta 50 veces más dulce que el ázucar común. Se suele combinar con otros endulzantes, debido a tener menor dulzor en comparación.",
      infoHumanos:
          "*No existe evidencia adecuada* de su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*No existe evidencia adecuada* de su carcinogenicidad en *animales* experimentales.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags: "E952, e952i, e952ii, e952iii"),
  Agent(
      pubChemId: 11236,
      agent: "Clorhidrato de Semicarbazida",
      group: 4,
      volumen: "12, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Compuesto químico reactivo empleado para detectar cetonas y aldehídos. Puede estar presente como contaminante en comidas envasadas, debido a envases plásticos sometidos a altas temperaturas.",
      infoHumanos:
          "*No existe evidencia* ni estudios en relación a la carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existencia evidencia limitada* de carcinogenicidad en ratones después de ingesta oral.",
      addInfo: "",
      tags:
          "Clorhidrato de Semicarbazida, Semicarbazida, Semcarbazide hydrochloride,azodicarbonamida"),
  Agent(
      pubChemId: 26042,
      agent: "Dióxido de Titanio",
      group: 3,
      volumen: "47, 93",
      yearPub: 2010,
      yearEv: 2006,
      descInfo:
          "Colorante natural de color blanco puro. Se utiliza en dulces, bebidas en polvo, cafés en capsula, galletas y otros alimentos con colorante blanco. También se utiliza en otros productos como pastas de dientes, fármacos, pinturas, papeles, entre otros.",
      infoHumanos:
          "*No existe evidencia adecuada* para determinar su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* de su carcinogenicidad en *animales*.",
      addInfo:
          "Permitido su uso en Chile, con restricción en acorde con RSA. Se retiró su uso en la Unión Europea en 2022, esto debido a un último estudio que determina que sus nanoparticulas causan daños cromosómicos en animales. Por ende, se potencia el riesgo de provocar Síndrome de Intestino Irritable.",
      tags:
          "E171, blanco 6, dióxido de titanio, blanco de titanio, titanium white"),
  Agent(
      pubChemId: 7187,
      agent: "Peróxido de benzoilo",
      group: 4,
      volumen: "36, Sup 7, 71",
      yearPub: 1999,
      yearEv: 1998,
      descInfo:
          "Agente blanqueador utilizado en harinas, aceites, ceras y algunos quesos.",
      infoHumanos:
          "*No existe evidencia adecuada* para su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe limitada evidencia* de su carcinogenicidad en *animales*.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags:
          "benzoperoxido, e928, e-928, e 928, peróxido de benzoilo, peroxido de benzoilo, benzoilo"),
  Agent(
      pubChemId: 22830,
      agent: "Rojo Cítrico 2",
      group: 3,
      volumen: "8, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo: "Colorante sintético de color naranjo rojizo.",
      infoHumanos:
          "*No existe evidencia ni datos* para determinar su carcinogenicidad en *humanos*. Esto se debe a que no se han realizados experimentos en humanos. Sin embargo, al tener *suficiente evidencia* en animales, se considera como un *posible carcinogenico* para humanos.",
      infoAnimales:
          "*Existe suficiente evidencia* de su carcinogenicidad en *animales*. Los experimentos en ratas de laboratorio demuestran hiperplasia de las paredes de la vejiga. Así también, se encontraron otros tumores malignos en varios órganos.",
      addInfo: "No existe información en el RSA respecto a este colorante.",
      tags:
          "e 121, e121, citrus red 2, rojo citrico 2, solvent red 80, rojo solvente 80"),
  Agent(
      pubChemId: 5143,
      agent: "Sacarina (y sus sales sódicas)",
      group: 4,
      volumen: "Sup 7, 73",
      yearPub: 1999,
      yearEv: 1998,
      descInfo:
          "Edulcorante sintético bajo en calorias. Obtenido a través de una síntesis química del tolueno. Es hasta 300 veces más dulce que el ázucar, y se suele combinar con otros endulzantes menos dulces, con el fin de suavizar su sabor metálico.",
      infoHumanos:
          "*No existe evidencia adecuada* para determinar su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* de su carcinogenicidad en *animales*, en su forma sódica. *No existe evidencia adecuada* de carcinogenicidad en *animales* para su forma ácida.",
      addInfo: "Permitido su uso en Chile, con restricción en acorde con RSA.",
      tags: "sacarina, saccharin, e954, e954i, e954ii, e954iii, e954iv"),
  Agent(
      pubChemId: 16887,
      agent: "Verde Sólido FCF",
      group: 4,
      volumen: "16, Sup 7",
      yearPub: 1987,
      yearEv: 1987,
      descInfo:
          "Colorante sintético de color verde azulado. Se obtiene por síntesis de benceno.",
      infoHumanos:
          "*No existencia evidencia* ni estudios para determinar su carcinogenicidad en *humanos*.",
      infoAnimales:
          "*Existe suficiente evidencia* para determinar su carcinogenicidad en *ratas* de laboratorio. Produce sarcomas en contacto repetido con la piel de *animales*.",
      addInfo:
          "Permitido su uso en Chile, con restricción en acorde con RSA. Prohibido su uso en la Unión Europea como colorante para comidas, pero se permite su uso en cosméticos. Prohibido para algunas comidas en Japón.",
      tags: "E143, Solid green fcf")
];
