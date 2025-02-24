import 'package:flutter/material.dart';
import 'package:pos/util/responsive.dart';
import '../../../constant/constants.dart';
import '../../../data/cloud_storage_data.dart';
import 'file_info_card.dart';

class DashboardDetails extends StatelessWidget {
  const DashboardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Dashboard",
        //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //     color: textHeadingColor,
        //   ),
        // ),
        const SizedBox(height: defaultPadding),
        // [Mobile]
        // crossAxisCount: size.width < 650 ? 2 : 4
        // childAspectRatio: size.width < 650 ? 1.3 : 1,
        // [Desktop]
        // childAspectRatio: size.width < 1400 ? 1.1 : 1.4,

        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: size.width < 650 ? 1 : 3,
            childAspectRatio: size.width < 650 ? 3.8: 2.1,
          ),
          tablet: const FileInfoCardGridView(
            crossAxisCount: 3,
            childAspectRatio: 2.1,
          ),
          desktop: const FileInfoCardGridView(
            crossAxisCount: 3,
            childAspectRatio: 2.1,
          ),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
