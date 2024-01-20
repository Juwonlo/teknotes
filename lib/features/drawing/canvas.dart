import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/common/drawing_point.dart';


class DrawingRoomScreen extends StatefulWidget {
  const DrawingRoomScreen({super.key});

  @override
  State<DrawingRoomScreen> createState() => _DrawingRoomScreenState();
}

class _DrawingRoomScreenState extends State<DrawingRoomScreen> {
  var avaiableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Color(0xffa800ff),
    Color(0xff2b62ff),
    Colors.green,
    Color(0xff1C0E4C),
  ];

  var historyDrawingPoints = <DrawingPoint>[];
  var drawingPoints = <DrawingPoint>[];

  var selectedColor = Colors.black;
  var selectedWidth = 2.0.w;

  DrawingPoint? currentDrawingPoint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // backgroundColor: Colors.grey[200],
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w,),
          child: Stack(
            children: [
              GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    currentDrawingPoint = DrawingPoint(
                      id: DateTime.now().microsecondsSinceEpoch,
                      offsets: [
                        details.localPosition,
                      ],
                      color: selectedColor,
                      width: selectedWidth,
                    );

                    if (currentDrawingPoint == null) return;
                    drawingPoints.add(currentDrawingPoint!);
                    historyDrawingPoints = List.of(drawingPoints);
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    if (currentDrawingPoint == null) return;

                    currentDrawingPoint = currentDrawingPoint?.copyWith(
                      offsets: currentDrawingPoint!.offsets
                        ..add(details.localPosition),
                    );
                    drawingPoints.last = currentDrawingPoint!;
                    historyDrawingPoints = List.of(drawingPoints);
                  });
                },
                onPanEnd: (_) {
                  currentDrawingPoint = null;
                },
                child: CustomPaint(
                  painter: DrawingPainter(
                    drawingPoints: drawingPoints,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),

              /// color pallet
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 16.w,
                right: 16.w,
                child: SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: avaiableColor.length,
                    separatorBuilder: (_, __) {
                      return  SizedBox(width: 8.w);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = avaiableColor[index];
                          });
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: avaiableColor[index],
                            shape: BoxShape.circle,
                          ),
                          foregroundDecoration: BoxDecoration(
                            border: selectedColor == avaiableColor[index]
                                ? Border.all(color: Colors.black, width: 4.w)
                                : null,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// pencil size
              Positioned(
                top: MediaQuery.of(context).padding.top + 80,
                right: 0.w,
                bottom: 150.h,
                child: RotatedBox(
                  quarterTurns: 3, // 270 degree
                  child: Slider(
                    value: selectedWidth,
                    min: 1,
                    max: 20,
                    activeColor: AppColor.secondaryColor,
                    onChanged: (value) {
                      setState(() {
                        selectedWidth = value;
                      });
                    },
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                right:  0,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0.00,
                    heroTag: "Undo",
                    onPressed: () {
                      if (drawingPoints.isNotEmpty && historyDrawingPoints.isNotEmpty) {
                        setState(() {
                          drawingPoints.removeLast();
                        });
                      }
                    },
                    child: SizedBox(
                      height: 30.h,
                      child: Image.asset(
                        'assets/images/vector-byo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0.00,
                    heroTag: "Redo",
                    onPressed: () {
                      setState(() {
                        if (drawingPoints.length < historyDrawingPoints.length) {
                          // 6 length 7
                          final index = drawingPoints.length;
                          drawingPoints.add(historyDrawingPoints[index]);
                        }
                      });
                    },
                    child: SizedBox(
                      height: 30.h,
                      child: Image.asset(
                        'assets/images/vector-eHs.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
        )
      ),

    );
  }
}

