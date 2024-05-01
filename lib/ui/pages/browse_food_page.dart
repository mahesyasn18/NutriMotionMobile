import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_food_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class BrowseFoodPage extends StatefulWidget {
  const BrowseFoodPage({super.key});

  @override
  State<BrowseFoodPage> createState() => _BrowseFoodPageState();
}

class _BrowseFoodPageState extends State<BrowseFoodPage> {
  final searchController = TextEditingController(text: '');

  bool validate() {
    if (searchController.text.isEmpty) {
      return false;
    }
    return true;
  }

  final List<Map<String, String>> foodDict = [
    {
      'nama': 'pisang',
      'kalori': '120',
      'size': '20',
    },
    {
      'nama': 'jambu',
      'kalori': '60',
      'size': '15',
    },
    {
      'nama': 'jambu',
      'kalori': '60',
      'size': '15',
    },
    {
      'nama': 'jambu',
      'kalori': '60',
      'size': '15',
    },
    {
      'nama': 'jambu',
      'kalori': '60',
      'size': '15',
    },
    {
      'nama': 'jambu',
      'kalori': '60',
      'size': '15',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              title: const Text('Pilih Asupan Hari Ini'),
              backgroundColor: whiteColor,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: CustomSearchFormField(
                        hints: 'Cari Makanan',
                        controller: searchController,
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/add-new-food');
                    },
                    child: Container(
                    height: 56,
                    width: 376,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: greenColor,
                    ),
                    child: Text(
                      'Tambah Makanan Baru',
                      style: whitePoppinsTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold
                      ),
                    ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Daftar Makanan dan Minuman',
                      style: blackPoppinsTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: foodDict.map((food) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/add-food');
                            },
                            child: CustomFoodTile(
                              foodName: food['nama'].toString(), 
                              foodCal: food['kalori'],
                              foodSize: food['size'],
                            ),
                          )
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );    
  }
}