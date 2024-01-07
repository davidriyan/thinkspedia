import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('First Week'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Text(
                'Ini week pertama saya magang di Thinkspedia',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 20,
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: SvgPicture.asset('assets/svgs/people_writing.svg'),
                    ),
                  ),
                  const Gap(20),
                  Material(
                    elevation: 20,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'assets/images/person_using_mobile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Transform.rotate(
                angle: 0.2,
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.green,
                ),
              ),
              const Gap(30),
              Transform.scale(
                scale: 1.8,
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
              const Gap(30),
              Transform.translate(
                offset: const Offset(10.0, 25.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
