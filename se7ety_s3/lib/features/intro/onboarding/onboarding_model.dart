import 'package:se7ety/core/constants/app_images.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: AppImages.onboarding1Svg,
    title: 'ابحث عن دكتور متخصص',
    description:
        'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.',
  ),
  OnboardingModel(
    image: AppImages.onboarding2Svg,
    title: 'سهولة الحجز',
    description: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.',
  ),
  OnboardingModel(
    image: AppImages.onboarding3Svg,
    title: 'آمن وسري',
    description: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.',
  ),
];
