class PDDBoardContent {
  String image;
  String title;
  String discription;

  PDDBoardContent({this.image, this.title, this.discription});
}

List<PDDBoardContent> contents = [
  PDDBoardContent(
      title: 'Capture it.',
      image: 'images/Boards/PDDBoard/PDDBoarding1.png',
      discription: 'Take or upload a Photo of your plant'),
  PDDBoardContent(
      title: 'Scan it.',
      image: 'images/Boards/PDDBoard/PDDBoarding2.png',
      discription: "Scan all your plants to detect their health quality"),
  PDDBoardContent(
      title: 'Check Result.',
      image: 'images/Boards/PDDBoard/PDDBoarding3.png',
      discription:
          "Check The Result and Know More about how to treat your Plant. "),
];
