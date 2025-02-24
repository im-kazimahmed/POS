import 'dart:developer';

import 'package:countries_world_map/components/canvas/shapes/shape.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';

class DataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dateOfBirth;
  final String image;
  final String dateOfJoined;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.image,
    required this.dateOfJoined,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dateOfBirth: json['dob'],
      image: json['profile_pic'],
      dateOfJoined: json['created_at'],
    );
  }
}

class BillDetailsView extends StatefulWidget {
  const BillDetailsView({super.key});

  @override
  State<BillDetailsView> createState() => _BillDetailsViewState();
}

class _BillDetailsViewState extends State<BillDetailsView> {
  int _currentPage = 1;
  int _pageSize = 10;
  List<DataModel> _data = [
    DataModel(
      id: 1,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 2,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 3,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 4,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 5,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 6,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 7,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 8,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 9,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 10,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 11,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 12,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 13,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 14,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    DataModel(
      id: 15,
      name: "Kazim",
      email: "kazim.solangi@gmail.com",
      phone: "+92 3043806072",
      gender: "Male",
      dateOfBirth: "8/16/2023",
      dateOfJoined: "8/16/2023",
      image: "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),

  ];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    // final response = await http.get(Uri.parse(
    //     '${ApiEndpoint.users}?page=$_currentPage'));

    // if (response.statusCode == 200) {
    //   final jsonData = json.decode(response.body);
    //   inspect(jsonData);
    //   final dataList = jsonData['data']['users'] as List<dynamic>;
    //
    //   final List<DataModel> newData =
    //   dataList.map((item) => DataModel.fromJson(item)).toList();
    //
    //   setState(() {
    //     _data.addAll(newData);
    //     _isLoading = false;
    //   });
    // } else {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   throw Exception('Failed to fetch data');
    // }
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Theme(
        data: Theme.of(context).copyWith(
          dataTableTheme: DataTableThemeData(
            // headingRowColor: WidgetStateColor.resolveWith((states) => backgroundColor),
            dataRowColor: WidgetStateColor.resolveWith((states) => backgroundColor),
            dividerThickness: 0.0,
            headingTextStyle: GoogleFonts.poppins(
              color: primaryColor,
            ),
            dataTextStyle: GoogleFonts.poppins(
              color: primaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          textTheme: TextTheme(
            labelSmall: GoogleFonts.poppins(
              color: backgroundColor,
            ),
            bodySmall: GoogleFonts.poppins(
              color: primaryColor,
            ),
            bodyMedium: GoogleFonts.poppins(
              color: primaryColor,
            ),
          ),
          cardTheme: CardTheme(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              side: const BorderSide(color: Colors.black, width: 1),
            ),
          ),
        ),
        child: _isLoading ? SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: primaryColor,
              ),
            ],
          ),
        ): Container(
          // decoration: const BoxDecoration(
          //   color: backgroundColor,
          //   borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
          // ),
          child: PaginatedDataTable(

            headingRowColor: WidgetStateColor.resolveWith((states) => backgroundColor),
            rowsPerPage: _pageSize,
            showFirstLastButtons: true,
            headingRowHeight: 40.0,
            availableRowsPerPage: const [10, 25, 50],
            onRowsPerPageChanged: (value) {
              setState(() {
                _pageSize = value!;
              });
            },
            columns: [
              DataColumn(
                label: Text(
                  'Invoice Id',
                  style: GoogleFonts.poppins(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Customer',
                  style: GoogleFonts.poppins(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Sales Date',
                  style: GoogleFonts.poppins(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Paid Amount',
                  style: GoogleFonts.poppins(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Sales Status',
                  style: GoogleFonts.poppins(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Payment Method',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ],
            source: _DataSource(data: _data),
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<DataModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(cells: [
      DataCell(
        Text(
          item.id.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      DataCell(
        Text(
          item.name.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      DataCell(
        Text(
          item.name.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      DataCell(
        Text(
          item.name.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      DataCell(
        Text(
          item.name.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      // DataCell(Text(item.gender.toString())),
      DataCell(_buildStatusBadge(item.gender)),
      // DataCell(
      //   Container(
      //     height: 50,
      //     width: 40,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      //     child: Image.network(
      //       width: 40,
      //       height: 50,
      //       fit: BoxFit.fill,
      //       item.image,
      //     ),
      //   ),
      // ),
      // DataCell(Text(item.dateOfJoined.toString())),
    ]);
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case "Delivered":
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade700;
        break;
      case "In Progress":
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade700;
        break;
      case "Returned":
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade700;
        break;
      default:
        backgroundColor = Colors.grey.shade100;
        textColor = Colors.grey.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Text(
        status,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: textColor,
        ),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}