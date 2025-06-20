import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';
import 'package:disease_detective/features/profile/data/models/medical_record_model.dart';
import 'package:disease_detective/features/profile/data/static/medical_records_list.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_medical_record_card.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<MedicalRecord> _filteredRecords = [];

  @override
  void initState() {
    super.initState();
    _filteredRecords = medicalRecords;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRecords(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRecords = medicalRecords;
      } else {
        _filteredRecords = medicalRecords
            .where((record) =>
                record.condition.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppString.medicalHistory),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColor.subColor,
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                cursorColor: AppColor.bodyColor,
                onChanged: _filterRecords,
                decoration: const InputDecoration(
                  hintText: AppString.search,
                  hintStyle: TextStyle(
                    color: AppColor.subColor,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.subColor,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Medical Records List
            Expanded(
              child: _filteredRecords.isEmpty
                  ? const Center(
                      child: Text(
                        'No medical records found',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.subColor,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredRecords.length,
                      itemBuilder: (context, index) {
                        final record = _filteredRecords[index];
                        final showDayHeader = index == 0 ||
                            _filteredRecords[index - 1].day != record.day;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (showDayHeader) ...[
                              if (index > 0) const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, bottom: 12),
                                child: Text(
                                  record.day,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.bodyColor,
                                  ),
                                ),
                              ),
                            ],
                            CustomMedicalRecordCard(record: record),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
