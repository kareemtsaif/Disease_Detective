import 'package:flutter/material.dart';
import 'package:disease_detective/core/controllers/notification_controller.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/features/home/data/models/notification_model.dart';
import 'package:disease_detective/features/home/presentation/views/widgets/assessment_modal.dart';
import 'package:disease_detective/features/home/presentation/views/widgets/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  final NotificationController controller;

  const NotificationsPage({
    super.key,
    required this.controller,
  });

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  void _handleStartButton(NotificationItem notification) {
    _buttonAnimationController.forward().then((_) {
      if (mounted) _buttonAnimationController.reverse();
    });

    widget.controller.markAsRead(notification.id);
    _showAssessmentModal();
  }

  void _showAssessmentModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.transparent,
      builder: (context) => const AssessmentModal(),
    );
  }

  void _deleteNotification(NotificationItem notification) {
    widget.controller.deleteNotification(notification.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.primaryColor,
        content: const Text(AppString.notificationRemoved,
            style: TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        action: SnackBarAction(
          label: AppString.undo,
          textColor: AppColor.bodyColor,
          onPressed: () => widget.controller.restoreNotification(notification),
        ),
        behavior: SnackBarBehavior.floating,
        width: 300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: _buildAppBar(),
      body: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, child) {
          final notifications = widget.controller.notifications;

          if (notifications.isEmpty) {
            return _buildEmptyState();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Dismissible(
                  key: Key(notification.id),
                  background: _buildDismissibleBackground(true),
                  secondaryBackground: _buildDismissibleBackground(false),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      widget.controller.markAsRead(notification.id);
                      return false;
                    }
                    return true;
                  },
                  onDismissed: (direction) => _deleteNotification(notification),
                  child: NotificationCard(
                    notification: notification,
                    onTap: () => widget.controller.markAsRead(notification.id),
                    onButtonPressed: () => _handleStartButton(notification),
                    buttonController: _buttonAnimationController,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.white,
      elevation: 0,
      leadingWidth: 70,
      leading: Container(
        margin: const EdgeInsets.all(8),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.grey,
            width: 2.0,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.subColor,
          ),
        ),
      ),
      title: const CustomHeadTitle(title: AppString.notification),
      centerTitle: true,
      actions: [
        ListenableBuilder(
          listenable: widget.controller,
          builder: (context, child) {
            if (!widget.controller.hasUnread) return const SizedBox.shrink();

            return TextButton(
              onPressed: () {
                widget.controller.markAllAsRead();
              },
              child: const Text(
                AppString.markAllRead,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.5,
                  decorationColor: AppColor.primaryColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: AppColor.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            AppString.noNotifications,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.bodyColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            AppString.youAreAllCaughtUp,
            style: TextStyle(
              fontSize: 16,
              color: AppColor.subColor,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              AppString.goBack,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDismissibleBackground(bool isLeft) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isLeft ? AppColor.notificationLeft : AppColor.notificationRight,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        isLeft ? Icons.check_circle : Icons.delete,
        color: isLeft ? AppColor.primaryLight : AppColor.red,
        size: 24,
      ),
    );
  }
}
