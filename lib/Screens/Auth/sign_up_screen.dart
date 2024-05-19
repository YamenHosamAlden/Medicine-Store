import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/auth_bloc/auth_bloc.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Main/main_screen.dart';
import 'package:medicinestore/Util/Dialogs/dialog_loading.dart';
import 'package:medicinestore/Util/Dialogs/localization_pop_up.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_button.dart';
import 'package:medicinestore/Widgets/custom_text.dart';
import 'package:medicinestore/Widgets/custom_text_falid.dart';
import 'package:medicinestore/Widgets/select_number_widget.dart';

import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController numberController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  Country? country;

  late AuthBloc authBloc;

  int age = 10;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthStates>(
            listener: (context, state) {
              if (state is SignUpLoadingState) {
                showLoaderDialog(context);
              }
              if (state is SignUpErrorState) {
                GeneralRoute.navigatorPobWithContext(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColors.redColor,
                  duration: const Duration(seconds: 5),
                  content: Text(
                    state.message,
                  ),
                ));
              }
              if (state is SignUpSuccesfulState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColors.greanColor,
                  duration: const Duration(seconds: 5),
                  content: Text(
                    "SignUp Succesful".tr(context),
                  ),
                ));
                // GeneralRoute.navigatorPobWithContext(context);
                GeneralRoute.navigatorPushAndRemoveScreensWithContext(
                    context, const MainScreen());
              }
            },
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              GeneralRoute.navigatorPobWithContext(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: AppColors.primaryColor,
                              size: 8.w,
                            )),
                        IconButton(
                          onPressed: () {
                            popUpChooseLocale(context);
                          },
                          icon: Image.asset(
                            AppAssets.langIcon,
                            height: 5.h,
                            width: 10.w,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                            ),
                            child: Image(
                              image: const AssetImage(
                                AppAssets.logoImage,
                              ),
                              height: 30.h,
                              width: 60.w,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textData: "Create Account".tr(context),
                                textStyle: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: CustomTextField(
                              controller: nameController,
                              fillColor: AppColors.textFieldColor,

                              prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  child: Image(
                                    image:
                                        const AssetImage(AppAssets.profileIcon),
                                    color: AppColors.primaryColor,
                                    width: 5.w,
                                    height: 2.h,
                                    fit: BoxFit.fill,
                                  )),
                              textInputType: TextInputType.name,

                              hintText: "Enter your name".tr(context),
                              // validatorMessage:
                              //     "Please Enter Your Name".tr(context),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: CustomTextField(
                              controller: emailController,
                              fillColor: AppColors.textFieldColor,

                              prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  child: Image(
                                    image: const AssetImage(AppAssets.smsIcon),
                                    color: AppColors.primaryColor,
                                    width: 5.w,
                                    height: 2.h,
                                    fit: BoxFit.fill,
                                  )),
                              textInputType: TextInputType.name,

                              hintText: "Enter Your Email".tr(context),
                              // validatorMessage:
                              //     "Please Enter Your Name".tr(context),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: CustomTextField(
                              controller: phoneController,
                              fillColor: AppColors.textFieldColor,
                              prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  child: Image(
                                    image:
                                        const AssetImage(AppAssets.phoneIcon),
                                    color: AppColors.primaryColor,
                                    width: 5.w,
                                    height: 2.h,
                                    fit: BoxFit.fill,
                                  )),
                              textInputType: TextInputType.phone,

                              hintText: "Enter Your Phone".tr(context),
                              // validatorMessage:
                              //     "Please Enter Your Email".tr(context),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SelectNumberWidget(
                            initValue: age,
                            maxValue: 120,
                            title: "Age",
                            minValue: 8,
                            getSelectedNumber: (newAge) {
                              age = newAge;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: CustomTextField(
                              controller: passwordController,
                              fillColor: AppColors.textFieldColor,

                              prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  child: Image(
                                    image: const AssetImage(AppAssets.lockIcon),
                                    color: AppColors.primaryColor,
                                    width: 5.w,
                                    height: 2.h,
                                    fit: BoxFit.fill,
                                  )),
                              textInputType: TextInputType.visiblePassword,

                              isPassword: true,

                              hintText: "Enter Your Password".tr(context),
                              // validatorMessage:
                              //     "Please Enter Your Password".tr(context),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: CustomButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // authBloc.add(SignUpEvent());
                                }
                              },
                              buttonText: "Create Account".tr(context),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.5.w),
                                child: const Divider(
                                  color: AppColors.borderColor,
                                ),
                              )),
                              CustomText(
                                textData: "Or".tr(context),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.5.w),
                                child: const Divider(
                                  color: AppColors.borderColor,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textData:
                                    "Do you have an account ?".tr(context),
                              ),
                              TextButton(
                                  onPressed: () {
                                    GeneralRoute.navigatorPobWithContext(
                                        context);
                                  },
                                  child: CustomText(
                                    textData: "Log in".tr(context),
                                    textStyle:
                                        const TextStyle(color: Colors.blue),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
