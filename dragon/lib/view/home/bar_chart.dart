import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/home_controller.dart';
import 'package:provider/provider.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, bottom: 16),
      child: AspectRatio(
        aspectRatio: 1.65,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) =>
                        const TextStyle(color: Color(0xff939393), fontSize: 10),
                    margin: 10,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Jan';
                        case 1:
                          return 'Feb';
                        case 2:
                          return 'Mar';
                        case 3:
                          return 'Apr';
                        case 4:
                          return 'Mei';
                        case 5:
                          return 'Jun';
                        case 6:
                          return 'Jul';
                        case 7:
                          return 'Agu';
                        case 8:
                          return 'Sep';
                        case 9:
                          return 'Okt';
                        case 10:
                          return 'Nov';
                        case 11:
                          return 'Des';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTextStyles: (context, value) => const TextStyle(
                        color: Color(
                          0xff939393,
                        ),
                        fontSize: 10),
                    margin: 0,
                  ),
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    getTextStyles: (context, value) => const TextStyle(
                        color: Colors.transparent, fontSize: 10),
                    margin: 0,
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xffe7e8ec),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: 16,
                barGroups: getData(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    var homeController = Provider.of<HomeController>(context, listen: false);
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_januari,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_januari, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_januari,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_januari, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_februari,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_februari, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_februari,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_februari, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_maret,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_maret, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_maret,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_maret, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_april,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_april, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_april,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_april, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_mei,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_mei, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_mei,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_mei, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_juni,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_juni, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_juni,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_juni, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_juli,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_juli, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_juli,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_juli, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_agustus,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_agustus, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_agustus,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_agustus, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 8,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_september,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_september, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_september,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_september, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 9,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_oktober,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_oktober, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_oktober,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_oktober, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 10,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_november,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_november, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_november,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_november, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 11,
        barsSpace: 8,
        barRods: [
          BarChartRodData(
              y: homeController.pengeluaran_desember,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pengeluaran_desember, OrangeColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: homeController.pemasukan_desember,
              rodStackItems: [
                BarChartRodStackItem(
                    0, homeController.pemasukan_desember, HijauColor),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
