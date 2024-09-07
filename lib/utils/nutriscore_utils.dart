String getNutriScoreImage(String score) {
  switch (score) {
    case "a":
      return "assets/Nutri-score-A.png";
    case "b":
      return "assets/Nutri-score-B.png";
    case "c":
      return "assets/Nutri-score-C.png";
    case "d":
      return "assets/Nutri-score-D.png";
    case "e":
      return "assets/Nutri-score-E.png";
    default:
      return "assets/nutriscore-not-applicable-new-en.png";
  }
}
