import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/auth_bloc/auth_bloc.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Auth/sign_up_screen.dart';
import 'package:medicinestore/Screens/Main/main_screen.dart';
import 'package:medicinestore/Util/Dialogs/dialog_loading.dart';
import 'package:medicinestore/Util/Dialogs/localization_pop_up.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_button.dart';
import 'package:medicinestore/Widgets/custom_text.dart';
import 'package:medicinestore/Widgets/custom_text_falid.dart';

import 'package:sizer/sizer.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  Country? country;
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            textData: "Log in".tr(context),
                            textStyle: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          )
                        ],
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
                              image: const AssetImage(AppAssets.phoneIcon),
                              color: AppColors.primaryColor,
                              width: 5.w,
                              height: 2.h,
                              fit: BoxFit.fill,
                            )),
                        textInputType: TextInputType.phone,
                        hintText: "Enter Your Phone".tr(context),
                        validator: (input) {
                          if (input!.isEmpty) {
                            "Please Enter Your Phone".tr(context);
                          }
                          return null;
                        },
                      ),
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
                        validator: (input) {
                          if (input!.isEmpty) {
                            "Please Enter Your Password".tr(context);
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocListener<AuthBloc, AuthStates>(
                      listener: (context, state) {
                        if (state is SiginErrorState) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 5),
                            content: Text(
                              state.message,
                            ),
                          ));
                        }
                        if (state is SiginLoadingState) {
                          showLoaderDialog(context);
                        }
                        if (state is SiginSuccesfulState) {
                          Navigator.of(context).pop();
                          // Fluttertoast.showToast(
                          //     msg: "SignIn Succesful".tr(context),
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.TOP,
                          //     backgroundColor: Colors.green,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);

                          GeneralRoute.navigatorPushAndRemoveScreensWithContext(
                              context, const MainScreen());
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                            GeneralRoute.navigatorPushAndRemoveScreensWithContext(
                                context, const MainScreen());
                          },
                          buttonText: "Log in".tr(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          textData: "Don’t have an account yet?".tr(context),
                          textStyle: TextStyle(
                              color: AppColors.blackColor, fontSize: 12.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              GeneralRoute.navigatorPushWithContext(
                                  context, const SignUpScreen());
                            },
                            child: CustomText(
                              textData: "Sign up".tr(context),
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.blue,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
