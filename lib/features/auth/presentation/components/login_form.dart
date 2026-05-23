import '../../../../core/constants/app_import.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.borderRadiusCard),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            offset: Offset(0, -8),
            blurRadius: 15,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: AppSizes.cardPaddingTop,
        bottom: AppSizes.cardPaddingBottom,
        left: AppSizes.cardPaddingHorizontal,
        right: AppSizes.cardPaddingHorizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Column(
            children: [
              Text(
                AppStrings.welcomeBack,
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Text(
                AppStrings.signInSubtitle,
                style: AppTextStyles.body,
              ),
            ],
          ),
          const SizedBox(height: 31.5),
          // Form
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                previous.email != current.email ||
                previous.password != current.password ||
                previous.isPasswordVisible != current.isPasswordVisible ||
                previous.errorMessage != current.errorMessage,
            builder: (context, state) {
              return Column(
                children: [
                  CustomTextField(
                    label: AppStrings.emailAddress,
                    hint: AppStrings.emailHint,
                    icon: Icons.email_outlined,
                    controller: TextEditingController(text: state.email)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: state.email.length),
                      ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: context.read<LoginCubit>().emailChanged,
                  ),
                  const SizedBox(height: AppSizes.formGap),
                  CustomTextField(
                    label: AppStrings.password,
                    hint: AppStrings.passwordHint,
                    icon: Icons.lock_outline,
                    obscureText: !state.isPasswordVisible,
                    showVisibilityToggle: true,
                    onVisibilityToggle:
                        context.read<LoginCubit>().togglePasswordVisibility,
                    controller: TextEditingController(text: state.password)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: state.password.length),
                      ),
                    onChanged: context.read<LoginCubit>().passwordChanged,
                  ),
                  const SizedBox(height: AppSizes.paddingSmall),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {}, // Non-functional for now
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.linkText,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.formGap),
                  // Error Message
                  if (state.errorMessage != null) ...[
                    Container(
                      padding: const EdgeInsets.all(AppSizes.paddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: AppColors.error,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              state.errorMessage!,
                              style: AppTextStyles.inputText.copyWith(
                                color: AppColors.error,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.paddingSmall),
                  ],
                  // Login Button
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.loginStatus == RequestState.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppStrings.loginSuccessful),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      }
                    },
                    child: CustomButton(
                      text: AppStrings.login,
                      isLoading: state.loginStatus == RequestState.loading,
                      isEnabled: context.read<LoginCubit>().isFormValid,
                      onPressed: context.read<LoginCubit>().login,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSizes.formGap),
          // Divider
          Container(
            height: 1,
            color: const Color(0x4DE2BFB8),
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          // Sign Up Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.newUserToCulinara,
                style: AppTextStyles.body,
              ),
              GestureDetector(
                onTap: () {}, // TODO: Navigate to sign up
                child: Text(
                  AppStrings.signUp,
                  style: AppTextStyles.signUpLinkText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
