import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<Widget> forms = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  List<String> titles = [
    'Jenis Kelamin',
    'Tanggal Lahir',
    'Berat dan Tinggi Badan',
  ];

  List<String> subtitles = [
    'Silakan pilih jenis kelamin Anda.',
    'Silakan pilih tanggal lahir Anda.',
    'Silakan masukkan berat dan tinggi badan Anda.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: forms,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                height: MediaQuery.of(context).size.height * 0.7,
                viewportFraction: 1,
                enableInfiniteScroll: false,
              ),
              carouselController: carouselController,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                if (currentIndex == forms.length - 1)
                  CustomFilledButton(title: 'Finish'),
                if (currentIndex != forms.length - 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        title: 'Back',
                        width: 100,
                        height: 50,
                        onPressed: () {
                          carouselController.previousPage();
                        },
                      ),
                      CustomFilledButton(
                        title: 'Continue',
                        width: 200,
                        onPressed: () {
                          carouselController.nextPage();
                        },
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  static var controller = TextEditingController();
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static var controller = TextEditingController();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Tambahkan SingleChildScrollView di sini
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gender.gif',
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile(
              title: Text('Laki-laki'),
              value: 'Laki-laki',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('Perempuan'),
              value: 'Perempuan',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value as String?;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  static var controller = TextEditingController();
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/date.gif',
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tanggal Lahir',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text(selectedDate != null
                ? 'Tanggal dipilih: ${selectedDate.toString().substring(0, 10)}'
                : 'Pilih Tanggal'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  static var controller = TextEditingController();
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/height.gif',
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Berat Badan dan\nTinggi Badan saat ini',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormField(title: 'Berat Badan'),
            SizedBox(
              height: 20,
            ),
            CustomFormField(title: 'Tinggi Badan'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Final Screen'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('first page data: ${data['first']}'),
            Text('second page data: ${data['second']}'),
            Text('third page data: ${data['third']}'),
          ],
        ),
      ),
    );
  }
}
