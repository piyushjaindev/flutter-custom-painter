import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/current_time/current_time_cubit.dart';
import '../blocs/juggle_counter/juggle_counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrentTimeCubit, String>(
        builder: (context, state) {
          return CustomPaint(
            foregroundPainter: MyForegroundPainter(state),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150.h,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Text(
                          'LOGO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80.sp,
                          ),
                        ),
                        Text(
                          'Juggle Challenge',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/juggle.webp',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        right: 15.w,
                        bottom: 30.h,
                        child: Column(
                          children: [
                            Icon(
                              Icons.person_rounded,
                              size: 35.w,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 20.h),
                            Icon(
                              Icons.comment,
                              size: 35.w,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 20.h),
                            Icon(
                              Icons.share,
                              size: 35.w,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 75.h,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<JuggleCounterCubit>().juggleLeft();
                          },
                          child: ClipPath(
                            clipper: LeftButtonClipper(),
                            child: AspectRatio(
                              aspectRatio: 1.4,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/shoe.jpg'),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: BlocBuilder<JuggleCounterCubit,
                              JuggleCounterState>(builder: (context, state) {
                            return Container(
                              height: double.infinity,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    state.leftJuggle.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35.sp,
                                      shadows: [
                                        Shadow(
                                          color: Colors.blue,
                                          offset: Offset(-3.w, 3.h),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Juggles',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    state.rightJuggle.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35.sp,
                                      shadows: [
                                        Shadow(
                                          color: Colors.blue,
                                          offset: Offset(-3.w, 3.h),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            context.read<JuggleCounterCubit>().juggleRight();
                          },
                          child: ClipPath(
                            clipper: RightButtonClipper(),
                            child: AspectRatio(
                              aspectRatio: 1.4,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/shoe.jpg'),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.stadium_outlined,
                        color: Colors.white,
                        size: 30.w,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 30.w,
                      ),
                      const SizedBox.shrink(),
                      Icon(
                        Icons.groups_sharp,
                        color: Colors.white,
                        size: 30.w,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyForegroundPainter extends CustomPainter {
  const MyForegroundPainter(this.currentTime);

  final String currentTime;

  @override
  void paint(Canvas canvas, Size size) {
    //1. paint red triangle over bottom tabs
    var paint = Paint()..color = Colors.red;
    var path = Path();
    path.moveTo(size.width / 2 - 40.w, size.height - 50.h);
    path.lineTo(size.width / 2, size.height - 10.h);
    path.lineTo(size.width / 2 + 40.w, size.height - 50.h);
    path.close();
    canvas.drawPath(path, paint);

    //2. paint black triangle over red triangle form step 1
    var paint2 = Paint()..color = Colors.black;
    var path2 = Path();
    path2.moveTo(size.width / 2 - 34.w, size.height - 59.h);
    path2.lineTo(size.width / 2, size.height - 24.h);
    path2.lineTo(size.width / 2 + 34.w, size.height - 59.h);
    path2.close();
    canvas.drawPath(path2, paint2);

    //3. paint red border around black container of logo
    var paint3 = Paint()..color = Colors.red;
    var path3 = Path();
    path3.moveTo(0, 150.h);
    path3.lineTo(size.width / 2 - 70.w, 150.h);
    path3.lineTo(size.width / 2 - 38.w, 188.h);
    path3.lineTo(size.width / 2 + 38.w, 188.h);
    path3.lineTo(size.width / 2 + 70.w, 150.h);
    path3.lineTo(size.width, 150.h);
    path3.lineTo(size.width, 159.h);
    path3.lineTo(size.width / 2 + 76.w, 159.h);
    path3.lineTo(size.width / 2 + 43.w, 198.h);
    path3.lineTo(size.width / 2 - 43.w, 198.h);
    path3.lineTo(size.width / 2 - 76.w, 159.h);
    path3.lineTo(0, 159.h);
    path3.close();
    canvas.drawPath(path3, paint3);

    //4. paint the remaining box from step 3 with black color
    var paint4 = Paint()..color = Colors.black;
    var path4 = Path();
    path4.moveTo(size.width / 2 - 72.w, 148.h);
    path4.lineTo(size.width / 2 + 72.w, 148.h);
    path4.lineTo(size.width / 2 + 38.w, 188.h);
    path4.lineTo(size.width / 2 - 38.w, 188.h);
    path4.close();
    canvas.drawPath(path4, paint4);

    //draw the text over box from step 4
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: currentTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout(minWidth: 0, maxWidth: 76.w);
    final offset = Offset(size.width / 2 - textPainter.width / 2, 150.h);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant MyForegroundPainter oldDelegate) =>
      oldDelegate.currentTime != currentTime;
}

class LeftButtonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 25.w, 0);
    path.lineTo(size.width, 25.h);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class RightButtonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(25.w, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 25.h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
