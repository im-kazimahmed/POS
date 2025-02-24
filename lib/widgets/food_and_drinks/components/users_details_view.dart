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

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
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
            headingRowColor: MaterialStateColor.resolveWith((states) => backgroundColor),
            headingTextStyle: GoogleFonts.poppins(
              color: textHeadingColor,
            ),
            dataTextStyle: GoogleFonts.poppins(
              color: textHeadingColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        child: PaginatedDataTable(
          rowsPerPage: _pageSize,
          showFirstLastButtons: false,
          headingRowHeight: 40.0,
          availableRowsPerPage: const [10, 25, 50],
          onRowsPerPageChanged: (value) {
            setState(() {
              _pageSize = value!;
            });
          },
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Gender')),
            DataColumn(label: Text('Date Of Birth')),
            DataColumn(label: Text('Image')),
            DataColumn(label: Text('Date')),
          ],
          source: _DataSource(data: _data),
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
      DataCell(Text(item.id.toString())),
      DataCell(Text(item.name)),
      DataCell(Text(item.email.toString())),
      DataCell(Text(item.phone.toString())),
      DataCell(Text(item.gender.toString())),
      DataCell(Text(item.dateOfBirth.toString())),
      DataCell(
        Container(
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.network(
            width: 40,
            height: 50,
            fit: BoxFit.fill,
            item.image,
          ),
        ),
      ),
      DataCell(Text(item.dateOfJoined.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}