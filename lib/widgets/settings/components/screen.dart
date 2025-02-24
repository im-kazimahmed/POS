import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/providers/settings_provider.dart';
import 'package:pos/widgets/responsive_layout.dart';
import 'package:pos/widgets/settings/components/top_navigation.dart';
import 'package:pos/widgets/text_field.dart';
import 'package:provider/provider.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Navigation Tabs
          // const SettingsTopNavigation(),
          const SizedBox(height: 20),

          // Card Details Section
          Text(
            'Payment Method',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ResponsiveLayout(
            desktopChildren: [
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Name on your Card',
              ),
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Expiry',
              ),
            ],
            mobileChildren: [
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Name on your Card',
              ),
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Expiry',
              ),
            ],
            // spacing: 20.0, // Optional: Set custom spacing if needed
          ),
          const SizedBox(height: defaultHeight),
          ResponsiveLayout(
            desktopChildren: [
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Card Number',
              ),
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'CVV',
              ),
            ],
            mobileChildren: [
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'Card Number',
              ),
              TextFieldWidget(
                controller: settingsProvider.txtExpiryController,
                hintText: 'CVV',
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
            ),
            child: const Text('+ Add another card'),
          ),

          // Contact Email Section
          buildContactEmailSection(),

          // Billing History Section
          buildBillingHistory(),
        ],
      ),
    );
  }

  // Function to build the card details section
  Widget buildCardDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }

  // Function to build the contact email section
  Widget buildContactEmailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Contact email',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: const Text('Send to the existing email'),
          leading: Radio(value: 0, groupValue: 1, onChanged: (value) {}),
        ),
        ListTile(
          title: const Text('Add another email address'),
          leading: Radio(value: 1, groupValue: 1, onChanged: (value) {}),
        ),
      ],
    );
  }

  // Function to build the billing history section
  Widget buildBillingHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Billing History',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
          },
          children: [
            buildTableRow(['Invoice', 'Date', 'Amount', 'Status', 'Tracking & Address'], isHeader: true),
            buildTableRow(['Account Sale', 'Apr 14, 2004', '\$3,050', 'Pending', 'LM580405575CN']),
            buildTableRow(['Account Sale', 'Jun 24, 2008', '\$1,050', 'Cancelled', 'AZ938540353US']),
            buildTableRow(['Netflix Subscription', 'Feb 28, 2004', '\$800', 'Refund', '3S331605504US']),
          ],
        ),
      ],
    );
  }

  // Function to build rows for the table
  TableRow buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.grey[200] : null),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: GoogleFonts.poppins(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        );
      }).toList(),
    );
  }
}
