import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/financial_assets_screen.dart';
import 'package:superman_exchange/screens/home_screen.dart';
import 'package:superman_exchange/screens/login/login_screen.dart';
import 'package:superman_exchange/screens/profile/profile_screen.dart';
import 'package:superman_exchange/screens/trade/trade_screen.dart';
import 'package:superman_exchange/screens/transactions/set_amount_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  bool isLogin = false;

  set loginStatus(bool isLogin_) {
    isLogin = isLogin_;
    notifyListeners();
  }
}

class MainScreenNavigationBar extends StatefulWidget {
  const MainScreenNavigationBar({super.key});

  @override
  State<MainScreenNavigationBar> createState() =>
      _MainScreenNavigationBarState();
}

class _MainScreenNavigationBarState extends State<MainScreenNavigationBar> {
  bool isDarkMode_ = false;

  UserProvider userProvider = UserProvider();

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 4);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return ChangeNotifierProvider(
      create: (_) {
        return userProvider;
      },
      child: Consumer<UserProvider>(
        builder: (buildContext, value, child) => PersistentTabView(
          controller: _controller,
          context,
          navBarStyle: NavBarStyle.style16,
          confineInSafeArea: true,

          backgroundColor: isDarkMode_ ? secondaryBlack : white,

          stateManagement: true,
          bottomScreenMargin: 0,
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.once,
          popAllScreensOnTapAnyTabs: false,
          // hideNavigationBarWhenKeyboardShows: true,
          // navBarHeight: 0,
          hideNavigationBarWhenKeyboardShows: true,

          decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10),
              colorBehindNavBar: Colors.white),

          items: [
            item(
              activeIcon: const Icon(Iconsax.profile_2user5, size: 28),
              inactiveIcon: const Icon(Iconsax.profile_2user, size: 20),
              title: "منو",
            ),
            item(
              activeIcon: const Icon(Iconsax.empty_wallet5, size: 28),
              inactiveIcon: const Icon(Iconsax.empty_wallet, size: 20),
              title: "دارایی",
            ),
            item(
              activeIcon:
                  const Icon(Iconsax.arrow_swap, color: white, size: 28),
              inactiveIcon:
                  const Icon(Iconsax.arrow_swap, color: white, size: 20),
              title: "معاملات",
              isCenter: true,
            ),
            item(
              activeIcon: const Icon(Iconsax.chart_215, size: 28),
              inactiveIcon: const Icon(Iconsax.chart_2, size: 20),
              title: "ترید",
            ),
            item(
              activeIcon: const Icon(Iconsax.home_25, size: 28),
              inactiveIcon: const Icon(Iconsax.home_2, size: 20),
              title: "خانه",
            ),
          ],
          screens: [
            userProvider.isLogin
                ? const ProfileScreen()
                : LoginScreen(loginAtBeginning: false),
            const FinancialAssetsScreen(),
            const SetAmountScreen(),
            const TradeScreen(),
            const HomeScreen(),
          ],
        ),
      ),
    );
  }

  PersistentBottomNavBarItem item({
    required String title,
    required Icon activeIcon,
    required Icon inactiveIcon,
    bool isCenter = false,
  }) {
    return PersistentBottomNavBarItem(
      icon: activeIcon,
      inactiveIcon: inactiveIcon,
      // --------------------------
      activeColorPrimary: blue,
      activeColorSecondary: blue,
      inactiveColorPrimary: lightGray,
      // --------------------------
      title: title,
      // iconSize: 24,

      textStyle: const TextStyle(
        fontSize: 12,
        color: primaryBlack,
      ),

      // --------------------------
    );
  }
}
