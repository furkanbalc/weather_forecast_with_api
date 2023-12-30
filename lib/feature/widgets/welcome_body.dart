part of '../view/welcome_view.dart';

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.kWeather,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        Text(
          AppStrings.kForecasts,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.goldenSamowar,
              ),
        ),
        const SizedBox(height: 50),
        CustomElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeView()),
          ),
          text: AppStrings.kGetStarted,
          buttonWidth: MediaQuery.sizeOf(context).width * 0.7,
        ),
      ],
    );
  }
}
