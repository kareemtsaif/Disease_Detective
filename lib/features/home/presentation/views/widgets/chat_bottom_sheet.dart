import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildHeader(),
          _buildContent(),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.chat_bubble, color: AppColor.primaryLight, size: 24),
          SizedBox(width: 8),
          Text(
            AppString.healthAssistantChat,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.bodyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 60,
              color: AppColor.grey,
            ),
            SizedBox(height: 16),
            Text(
              AppString.startConversation,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.subColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppString.chatDescription,
              style: TextStyle(
                fontSize: 14,
                color: AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppString.typeYourMessage,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColor.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: AppColor.primaryLight,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => (),
              icon: const Icon(Icons.send, color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
