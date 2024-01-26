import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/screens/login/login_screen.dart';
import 'package:superman_exchange/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart' as animate;
import 'package:superman_exchange/utils/theme/app_theme.dart';

enum WelcomeScreenState { login, descriptions }

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isDarkMode_ = false;

  WelcomeScreenState state = WelcomeScreenState.descriptions;
  int index = 0;

  List<Map<String, Widget>> descriptions() {
    List<Map<String, Widget>> data = [
      {
        "Title": const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "به صرافی",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "خوش آمدید",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "سوپرمن ",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: midBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
        "SubTitle": const Text(
          "با این دیزاین میتوانید به راحتی این طرح رو به برنامه نویس ارسال کنید و برنامه نویس شما این طرح رو روی صرافی شما پیاده سازی کنه.",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: lightGray,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      },
      {
        "Title": const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "معاملات امن",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "در سریع ترین زمان",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        "SubTitle": const Text(
          "با صرافی سوپرمن میتونید در سریع ترین زمان ممکن معاملات را انجام بدید.",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: lightGray,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      },
      {
        "Title": Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "همین حالا عضو",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: isDarkMode_ ? primaryBlack : white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "بشید.",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: isDarkMode_ ? primaryBlack : white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        "SubTitle": Text(
          "همین حالا میتونید در صرافی سوپرمن عضو بشید و احراز هویت کنید تا بتونید معاملات خودتان را انجام بدید.",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: isDarkMode_ ? primaryBlack : white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      },
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        if (index > 0) {
          setState(() {
            state = WelcomeScreenState.descriptions;
            index--;
          });
        }
      },
      child: Scaffold(
        backgroundColor: state == WelcomeScreenState.login
            ? blue
            : Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: state == WelcomeScreenState.login
              ? blue
              : Theme.of(context).scaffoldBackgroundColor,
          leadingWidth: 100,
          leading: TextButton(
            onPressed: () {
              if (index == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MainScreenNavigationBar(),
                  ),
                );
              } else if (0 <= index && index < 2) {
                setState(() {
                  state = WelcomeScreenState.login;
                  index = 2;
                });
              }
            },
            child: Text(
              "رد کردن",
              style: TextStyle(
                color: state == WelcomeScreenState.descriptions
                    ? midBlue
                    : isDarkMode_
                        ? primaryBlack
                        : white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              state == WelcomeScreenState.login
                  ? animate.Animate(
                      key: UniqueKey(),
                      effects: const [
                        animate.FadeEffect(
                            duration: Duration(milliseconds: 650)),
                        animate.SlideEffect(
                            duration: Duration(milliseconds: 650)),
                      ],
                      child: Image.asset(
                        "assets/images/login_img.png",
                        width: 322,
                        height: 322,
                      ),
                    )
                  : animate.Animate(
                      effects: const [
                        animate.FadeEffect(
                            duration: Duration(milliseconds: 650)),
                        animate.SlideEffect(
                            duration: Duration(milliseconds: 650)),
                      ],
                      child: Image.asset(
                        "assets/images/image_1.png",
                        width: 322,
                        height: 322,
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            description(),
                          ],
                        ),
                      ),
                      state == WelcomeScreenState.descriptions
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor: midBlue,
                                        foregroundColor: white),
                                    onPressed: () {
                                      index++;

                                      if (index == 2) {
                                        setState(() {
                                          state = WelcomeScreenState.login;
                                        });
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: SmoothPageIndicator(
                                    controller: PageController(
                                        viewportFraction: 1,
                                        initialPage: index),
                                    count: 2,
                                    textDirection: TextDirection.rtl,
                                    effect: const ExpandingDotsEffect(
                                      dotHeight: 4,
                                      dotWidth: 4,
                                      dotColor: lightGray,
                                      activeDotColor: midBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        isDarkMode_ ? primaryBlack : white,
                                    side: BorderSide(
                                        color:
                                            isDarkMode_ ? primaryBlack : white),
                                    minimumSize: const Size(130, 42),
                                    maximumSize: const Size(130, 42),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(
                                            isLogin: false,
                                            loginAtBeginning: true),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "ثبت نام",
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isDarkMode_ ? primaryBlack : white,
                                    foregroundColor:
                                        isDarkMode_ ? white : primaryBlack,
                                    minimumSize: const Size(130, 42),
                                    maximumSize: const Size(130, 42),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(
                                            isLogin: true,
                                            loginAtBeginning: true),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "ورود",
                                  ),
                                ),
                              ],
                            ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget description() {
    List<Map<String, Widget>> descriptionItems = descriptions();
    return AnimationLimiter(
      key: UniqueKey(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(seconds: 1),
            childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: -50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
            children: [
              descriptionItems[index]["Title"] ?? const SizedBox(),
              descriptionItems[index]["SubTitle"] ?? const SizedBox(),
            ]),
      ),
    );
  }
}
