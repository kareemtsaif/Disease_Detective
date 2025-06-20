import 'package:flutter/material.dart';
import 'package:health_guard/core/controllers/notification_controller.dart';
import 'package:health_guard/features/articles/presentation/views/articles_view.dart';
import 'package:health_guard/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:health_guard/features/home/presentation/views/screens/home_screen.dart';
import 'package:health_guard/features/home/presentation/views/screens/notifications_page.dart';
import 'package:health_guard/features/home/presentation/views/widgets/animated_floating_action_button.dart';
import 'package:health_guard/features/home/presentation/views/widgets/chat_bottom_sheet.dart';
import 'package:health_guard/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:health_guard/features/profile/presentation/views/profile_view.dart';

class HomeViewBody extends StatefulWidget {

  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => HomeViewBodyState();
}

class HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  late final NotificationController _notificationController;
  late final AnimationController _fabAnimationController;
  late final AnimationController _pageTransitionController;
  late final PageController _pageController;

  late final Animation<double> _fabScaleAnimation;
  late final Animation<double> _fabRotationAnimation;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _setupAnimations();
  }

  void _initializeControllers() {
    _notificationController = NotificationController();
    _pageController = PageController(initialPage: 0);
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _pageTransitionController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  void _setupAnimations() {
    _fabScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.85,
    ).animate(CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    ));

    _fabRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.25,
    ).animate(CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    _pageTransitionController.dispose();
    _pageController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;

    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _pageTransitionController.reset();
    _pageTransitionController.forward();
  }

  void _onFabPressed() {
    _fabAnimationController.forward().then((_) {
      _fabAnimationController.reverse();
    });
    _showChatDialog();
  }

  void _showChatDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChatBottomSheet(),
    );
  }

  void _openNotificationsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsPage(
          controller: _notificationController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: [
          HomeScreen(
            // token: widget.token,
            notificationController: _notificationController,
            onNotificationTap: _openNotificationsPage,
          ),
          const ChatbotView(),
          const ArticleView(),
          const ProfileView(),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        scaleAnimation: _fabScaleAnimation,
        rotationAnimation: _fabRotationAnimation,
        onPressed: _onFabPressed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
