import 'package:recipes_app_t3lm/core/utils/app_toast.dart';
import 'package:recipes_app_t3lm/features/auth/presentation/cubits/login_cubit.dart';

import '../../../../core/constants/app_import.dart';
import '../cubits/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = true;
  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  GlobalKey<FormState> formKey = GlobalKey();
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
              Text(AppStrings.welcomeBack, style: AppTextStyles.heading),
              const SizedBox(height: AppSizes.paddingSmall),
              Text(AppStrings.signInSubtitle, style: AppTextStyles.body),
            ],
          ),
          const SizedBox(height: 31.5),
          // Form
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: AppStrings.emailAddress,
                  hint: AppStrings.emailHint,
                  icon: Icons.email_outlined,
                  controller: email,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Your Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.formGap),
                CustomTextField(
                  label: AppStrings.password,
                  hint: AppStrings.passwordHint,
                  icon: Icons.lock_outline,
                  obscureText: isPasswordVisible,
                  showVisibilityToggle: true,
                  onVisibilityToggle: togglePasswordVisibility,
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Your password";
                    }
                    return null;
                  },
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
                // Login Button
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.loginState == RequestState.success) {
                      showToast(
                        state: ToastState.success,
                        message: "Login succssfully",
                      );
                      showToast(
                        state: ToastState.success,
                        message:
                            "welcome to our app, ${state.loginModel?.username ?? ""}",
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                    if (state.loginState == RequestState.error) {
                      showToast(
                        state: ToastState.error,
                        message: state.errorMessage,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      text: AppStrings.login,
                      isLoading: state.loginState == RequestState.loading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            username: email.text,
                            password: password.text,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.formGap),
          // Divider
          Container(height: 1, color: const Color(0x4DE2BFB8)),
          const SizedBox(height: AppSizes.paddingSmall),
          // Sign Up Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.newUserToCulinara, style: AppTextStyles.body),
              GestureDetector(
                onTap: () {},
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
