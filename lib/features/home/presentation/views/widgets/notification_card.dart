import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/features/home/data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;
  final VoidCallback onButtonPressed;
  final AnimationController buttonController;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onButtonPressed,
    required this.buttonController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.whiteDark,
        borderRadius: BorderRadius.circular(12),
        border: !notification.isRead
            ? Border.all(
                color: AppColor.primaryLight.withOpacity(0.3), width: 1.5)
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(),
            const SizedBox(width: 12),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(color: AppColor.lightBlue),
      child: const Icon(
        Icons.chat_bubble_outline,
        color: AppColor.primaryColor,
        size: 20,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 6),
        _buildMessage(),
        if (notification.hasButton) ...[
          const SizedBox(height: 12),
          _buildActionButton(),
        ],
        const SizedBox(height: 8),
        _buildTime(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            notification.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  notification.isRead ? FontWeight.w500 : FontWeight.w600,
              color: AppColor.bodyColor,
            ),
          ),
        ),
        if (!notification.isRead)
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  Widget _buildMessage() {
    return Text(
      notification.message,
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.subColor,
        height: 1.4,
      ),
    );
  }

  Widget _buildActionButton() {
    return AnimatedBuilder(
      animation: buttonController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + buttonController.value * 0.1,
          child: GestureDetector(
            onTap: onButtonPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                notification.buttonText ?? '',
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTime() {
    return Text(
      notification.time,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
