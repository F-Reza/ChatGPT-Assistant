class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Next-Digit',
    image: 'assets/images/chatbot.gif',
  ),
  OnBoarding(
    title: 'You can ask anything very easily',
    image: 'assets/images/bot-3.png',
  ),
  OnBoarding(
    title: 'Stay With Your Voice Assistant',
    image: 'assets/images/voice_chat.gif',
  ),
  OnBoarding(
    title: 'Use the image generation capabilities of the Open-AI',
    image: 'assets/images/bot-5.gif',
  ),
];
