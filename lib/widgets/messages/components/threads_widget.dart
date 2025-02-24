import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/providers/message_provider.dart';
import 'package:pos/util/responsive.dart';
import 'package:provider/provider.dart';

class ThreadsWidget extends StatelessWidget {
  const ThreadsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final msgProvider = Provider.of<MessageProvider>(context);
    return ListView.builder(
      itemCount: 30,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Responsive.isMobile(context) ? Axis.horizontal: Axis.vertical,
      itemBuilder: (context, index) {
        return SizedBox(
          width: Responsive.isMobile(context) ? 150 : null,
          child: ListTile(
            leading: ClipOval(
              child: Image.network("https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d"),
            ),
            title: Text(
              "User",
              style: GoogleFonts.poppins(
                color: primaryColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "Hello",
              style: GoogleFonts.poppins(),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              // List<String> ids = [
              //   '82091008-a484-4a89-ae75-a22bf8d6f3a2',
              //   '02797655-4d73-402e-a319-50fde79e2bc4',
              //   '64747b28-df19-4a0c-8c47-316dc3546e3c',
              //   '6a1a4351-cf05-4d0c-9d0f-47ed378b6112',
              //   '82091008-a484-4a89-ae75-a22bf8d6f3ac',
              // ];
              // ids.shuffle();

              // final _user2 = const types.User(
              //   id: '64747b28-df19-4a0c-8c47-316dc3546e3c',
              // );
              // msgProvider.selectUser(
              //   types.User(
              //     id: ids[0],
              //   ),
              // );
              msgProvider.loadMessages();
            },
          ),
        );
      },
    );
  }
}
