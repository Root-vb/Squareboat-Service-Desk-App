import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

class BottomSheetUtils extends StatelessWidget {
  const BottomSheetUtils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      "New",
      "Assigned",
      "Ongoing",
      "Completed",
      "Invalid",
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Filter",
                style: Styles.tsPrimaryColorBold19,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: AppColors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Text(
                        "Status",
                        style: Styles.tsPrimaryColorBold19,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          dense: true,
                          title: Text(
                            items[index],
                            style: Styles.tsPrimaryColorRegular14,
                          ),
                          value: false,
                          onChanged: (value) {},
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Text(
                        "Assigned To",
                        style: Styles.tsPrimaryColorBold19,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: AppColors.primaryBlue,
                    onPressed: () {},
                    child: const Text(
                      "Apply Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
