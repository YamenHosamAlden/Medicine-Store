import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:medicinestore/Bloc/main_bloc/main_bloc.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Cart/cart_screen.dart';
import 'package:medicinestore/Screens/Home/home_screen.dart';
import 'package:medicinestore/Screens/Main/Widgets/app_bar_widget.dart';
import 'package:medicinestore/Screens/Main/Widgets/bottom_navigationbar_item.dart';
import 'package:medicinestore/Screens/Main/Widgets/clipper.dart';
import 'package:medicinestore/Screens/Pharmacies/pharmacies_screen.dart';
import 'package:medicinestore/Screens/Profile/profile_screen.dart';
import 'package:medicinestore/Util/Dialogs/confirm_dialog.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Widget> screens;
    List<String> screenTitle=[ "Medicines Store","Pharmacies list","Cart","Profile"];
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {}
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    screens = [
      const HomeScreen(),
     const  PharmaciesScreen(),
     const  CartScreen(),
     const  ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        DateTime now = DateTime.now();
        if (didPop) {
          return;
        }
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          // Fluttertoast.showToast(msg: "Press again to leave app".tr(context));
        } else {
          showConfirmDialog(context,
              title: "Are you sure you want to leave app?".tr(context),
              onPressed: () {
            SystemNavigator.pop();
          });
        }
      },
      child: BlocListener<ConnectivityBloc, ConnectedState>(
        listener: (context, state) {
          if (state.message == "Connecting To Wifi") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 5),
              content: Text(
                state.message,
              ),
            ));
          }
          if (state.message == "Connecting To Mobile Data") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 5),
              content: Text(
                state.message,
              ),
            ));
          }
          if (state.message == "Lost Internet Connection") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
              content: Text(
                state.message,
              ),
            ));
          }
        },
        child: BlocBuilder<MainBloc, BottomNavigationBarState>(
          builder: (context, state) {
            return Scaffold(
              appBar: appBarWidget(context, title: screenTitle[context.read<MainBloc>().currentIndex].tr(context),buttonBack: false),
                key: scaffoldKey,
                body: BlocListener<ConnectivityBloc, ConnectedState>(
                    listener: (context, state) {},
                    child: screens[context.read<MainBloc>().currentIndex]),
                bottomNavigationBar: ClipPath(
                  clipper: TriangleClipper(),
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      width: double.infinity,
                      height: 12.h,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          image: DecorationImage(
                              image:
                                  AssetImage(AppAssets.backgroundbottomImage),
                              fit: BoxFit.cover)),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        selectedItemColor: AppColors.whiteColor,
                        unselectedItemColor: AppColors.whiteColor,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        currentIndex: context.read<MainBloc>().currentIndex,
                        onTap: (index) {
                          context
                              .read<MainBloc>()
                              .add(SelectBottomNavigationBarItem(index: index));
                        },
                        items: [
                          bottomNavigationBarItem(context,
                              currentIndex:
                                  context.read<MainBloc>().currentIndex,
                              index: 0,
                              label: "",
                              icon: AppAssets.homeIcon),
                          bottomNavigationBarItem(context,
                              currentIndex:
                                  context.read<MainBloc>().currentIndex,
                              index: 1,
                              icon: AppAssets.productIcon,
                              label: ""),
                          bottomNavigationBarItem(context,
                              currentIndex:
                                  context.read<MainBloc>().currentIndex,
                              index: 2,
                              icon: AppAssets.cartIcon,
                              label: ""),
                          bottomNavigationBarItem(context,
                              currentIndex:
                                  context.read<MainBloc>().currentIndex,
                              index: 3,
                              icon: AppAssets.profileIcon,
                              label: ""),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
