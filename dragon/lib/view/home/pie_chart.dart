import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/home_controller.dart';
import 'package:dragon/view/home/indicator.dart';
import 'package:provider/provider.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State {
  int touchedIndex = -1;
  Color colorPO = kPrimaryColor;
  Color colorBUY = OrangeColor;
  Color colorSO = UnguColor;
  Color colorSALE = HijauColor;

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      child: Container(
        height: 400,
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Statistics",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Image.asset(
                        "assets/images/ic_more2.png",
                        height: 20,
                      ),
                    ],
                  ),
                ),
                (homeController.trx_count > 0)
                    ? Expanded(
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection.touchedSectionIndex;
                                });
                              }),
                              startDegreeOffset: 270,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 1,
                              centerSpaceRadius: 10,
                              sections: showingSections()),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              "Tidak ada data",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: GreyColor),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Indicator(
                          color: colorPO,
                          text: 'Order Pembelian',
                          isSquare: false,
                          size: touchedIndex == 0 ? 10 : 14,
                          textColor:
                              touchedIndex == 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Indicator(
                          color: colorSO,
                          text: 'Order Penjualan',
                          isSquare: false,
                          size: touchedIndex == 2 ? 10 : 14,
                          textColor:
                              touchedIndex == 2 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Indicator(
                          color: colorBUY,
                          text: 'Pembelian',
                          isSquare: false,
                          size: touchedIndex == 1 ? 10 : 14,
                          textColor:
                              touchedIndex == 1 ? Colors.black : Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Indicator(
                          color: colorSALE,
                          text: 'Penjualan',
                          isSquare: false,
                          size: touchedIndex == 3 ? 10 : 14,
                          textColor:
                              touchedIndex == 3 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    var homeController = Provider.of<HomeController>(context, listen: false);
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 20.0 : 16.0;
        final radius0 = isTouched ? 50.0 : 40.0;
        final radius1 = isTouched ? 40.0 : 30.0;
        final radius2 = isTouched ? 30.0 : 20.0;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: colorPO,
              value: homeController.po_percent,
              title: '${homeController.po_percent.toStringAsFixed(2)}%',
              radius: radius0,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: colorPO.darken(40), width: 6)
                  : BorderSide(color: colorPO.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: colorBUY,
              value: homeController.buy_percent,
              title: '${homeController.buy_percent.toStringAsFixed(2)}%',
              radius: radius1,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: colorBUY.darken(40), width: 6)
                  : BorderSide(color: colorSO.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: colorSO,
              value: homeController.so_percent,
              title: '${homeController.so_percent.toStringAsFixed(2)}%',
              radius: radius2,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? BorderSide(color: colorSO.darken(40), width: 6)
                  : BorderSide(color: colorSO.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: colorSALE,
              value: homeController.sale_percent,
              title: '${homeController.sale_percent.toStringAsFixed(2)}%',
              radius: radius2,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? BorderSide(color: colorSALE.darken(40), width: 6)
                  : BorderSide(color: colorSALE.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
