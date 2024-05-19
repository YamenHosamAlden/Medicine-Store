import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/auth_bloc/auth_bloc.dart';
import 'package:medicinestore/Bloc/main_bloc/main_bloc.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Orders/orders_screen.dart';
import 'package:medicinestore/Screens/Profile/Widgets/menu_item.dart';
import 'package:medicinestore/Screens/Profile/Widgets/profile_info_card_widget.dart';
import 'package:medicinestore/Util/Dialogs/confirm_dialog.dart';
import 'package:medicinestore/Util/Dialogs/localization_pop_up.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_smart_refrecher_header_widget.dart';
import 'package:medicinestore/Widgets/loading_widget.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RefreshController refreshController = RefreshController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SmartRefresher(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        controller: refreshController,
        onRefresh: () {
          refreshController.refreshCompleted();
        },
        header: const CustomSmartRefrecherHeaderWidget(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const ProfileInfoCardWidget(),


              MenuItemm(
                title: "Edit Profile".tr(context),
                tap: () {
                  // GeneralRoute.navigatorPushWithContext(
                  //     context, EditProfileScreen());
                },
                image: AppAssets.userEditIcon,
              ),

                 MenuItemm(
                title: "My Orders".tr(context),
                tap: () {
                  GeneralRoute.navigatorPushWithContext(
                      context, const OrdersScreen());
                },
                image: AppAssets.ordersIcon,
              ),
              MenuItemm(
                title: "Notifications".tr(context),
                tap: () {},
                image: AppAssets.notificationIcon,
              ),
              MenuItemm(
                title: "Language".tr(context),
                tap: () {
                  popUpChooseLocale(context);
                },
                image: AppAssets.langIcon,
              ),
              // MenuItemm(
              //   title: "Contact us".tr(context),
              //   tap: () {
              //     GeneralRoute.navigatorPushWithContext(
              //         context, const ContactUsScreen());
              //   },
              //   image: AppAssets.supportIcon,
              // ),
              // MenuItemm(
              //   title: "Privacy Policy".tr(context),
              //   tap: () {
              //     launch(
              //       Uri.parse("https://www.kora-uae.com/privacy-policy.html"),
              //     );
              //     //       GeneralRoute.navigatorPushWithContext(
              //     //          context,
              //     //      const TermsAndConditionsScreens());
              //   },
              //   image: AppAssets.securitySafeIcon,
              // ),
              BlocConsumer<AuthBloc, AuthStates>(
                listener: (context, state) {
                  if (state is LogOutErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      duration: const Duration(seconds: 5),
                      content: Text(
                        state.message,
                      ),
                    ));
                  }
                  if (state is LogOutSuccesfulState) {
                    context
                        .read<MainBloc>()
                        .add(SelectBottomNavigationBarItem(index: 0));

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.greanColor,
                      duration: const Duration(seconds: 5),
                      content: Text(
                        "Log Out succesful".tr(context),
                      ),
                    ));
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      MenuItemm(
                        title: "Log Out".tr(context),
                        tap: () {
                          showConfirmDialog(context,
                              title: "Are you sure you want to log out?"
                                  .tr(context), onPressed: () {
                            // authBloc.add(LogOutEvent());
                          });
                        },
                        image: AppAssets.logoutIcon,
                      ),
                      if (state is LogOutLoadingState ||
                          state is DeleteAccountLoadingState)
                        SizedBox(
                            height: 8.h,
                            width: 16.w,
                            child: const LoadingWidget())
                    ],
                  );
                },
              )
            ]),
          ),
        ),
      )),
    );
  }
}
