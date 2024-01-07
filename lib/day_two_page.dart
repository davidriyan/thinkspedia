import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

class DayTwoPage extends StatelessWidget {
  const DayTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: size.width / 2,
                height: size.height / 4,
                child: Image.network(
                  'htt://i.pinimg.com/originals/c7/fa/89/c7fa89705d3397b653e808884c56b791.jpg',
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                          Text(
                            'Loading',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Tunggu sebentar ya',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Text('data');
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.height / 5,
                    child: Image.asset('assets/images/barcelona.png'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.height / 4.5,
                    child: Image.asset('assets/images/real_madrid.png'),
                  ),
                ],
              ),
              const Gap(20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.height / 4.5,
                    child: Image.asset('assets/images/real_madrid.png'),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/images/barcelona.png'),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 4,
              //   width: MediaQuery.of(context).size.width / 2,
              //   child: const ModelViewer(
              //     backgroundColor: Colors.grey,
              //     src: 'assets/3d/sneakers.glb',
              //     alt: 'product sneakers',
              //     ar: true,
              //     autoRotate: true,
              //     disableZoom: true,
              //   ),
              // ),
              // const Gap(20),
              Text(
                'Sneakers',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Gap(MediaQuery.of(context).size.height / 7),
            ],
          )
        ],
      ),
    );
  }
}
