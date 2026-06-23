import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/checkout/data/models/governorate_response/datum.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showGovernoratesBottomSheet(
  BuildContext context,
  List<Governorate> governorates,
  Function(Governorate governorate) onTap,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return GovBottomSheet(governorates: governorates, onTap: onTap);
    },
  );
}

class GovBottomSheet extends StatelessWidget {
  final List<Governorate> governorates;
  final Function(Governorate governorate) onTap;
  const GovBottomSheet({
    super.key,
    required this.governorates,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Gap(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select Governorate", style: TextStyles.subtitle1),
              GestureDetector(
                onTap: () => pop(context),
                child: Icon(Icons.close),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: ListView.separated(
              itemCount: governorates.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(governorates[index].governorateNameEn ?? ""),
                  onTap: () {
                    Navigator.pop(context);
                    onTap(governorates[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
