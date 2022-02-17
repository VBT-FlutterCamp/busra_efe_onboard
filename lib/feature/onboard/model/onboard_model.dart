class OnboardModel {
  final String title;
  final String description;
  final String image;

  OnboardModel(this.title, this.description, this.image);
}

List<OnboardModel> modelList = [
  OnboardModel(
      "Symptoms of Covid-19",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "assets/images/medical_care.svg"),
  OnboardModel(
      "Covid-19 Information",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "assets/images/social_distancing.svg"),
  OnboardModel(
      "Wash Hands",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "assets/images/wash_hands.svg"),
];
