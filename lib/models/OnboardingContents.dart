class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Get Your worker and get the Fix every thing",
    image: "assets/images/img.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay at home and your fix will occur",
    image: "assets/images/img_1.png",
    desc:
    "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when worker ready",
    image: "assets/images/img_2.png",
    desc:
    "Take control of notifications, collaborate live or on your own time.",
  ),
];