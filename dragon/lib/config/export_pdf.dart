import 'dart:io';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

Future<Uint8List> ExportPDF(List header, List isi_data, String title) async {
  final pdf = pdfWidget.Document();
  // print(isi_data[0].length);

  pdf.addPage(pdfWidget.Page(
    pageFormat: PdfPageFormat.a4,
    margin: pdfWidget.EdgeInsets.all(2),
    build: (context) {
      return pdfWidget.Column(
        crossAxisAlignment: pdfWidget.CrossAxisAlignment.start,
        children: [
          pdfWidget.Center(
            child: pdfWidget.Padding(
              padding: pdfWidget.EdgeInsets.only(top: 16, left: 16, right: 16),
              child: pdfWidget.Text(
                title,
                textAlign: pdfWidget.TextAlign.center,
                style: pdfWidget.TextStyle(
                    fontSize: 14, fontWeight: pdfWidget.FontWeight.bold),
              ),
            ),
          ),
          pdfWidget.Center(
            child: pdfWidget.Container(
              height: 24,
            ),
          ),
          pdfWidget.Padding(
            padding:
                pdfWidget.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: pdfWidget.Row(children: [
              pdfWidget.Expanded(
                flex: 2,
                child: pdfWidget.Text(header[0],
                    style: pdfWidget.TextStyle(fontSize: 12)),
              ),
              pdfWidget.Expanded(
                flex: 2,
                child: pdfWidget.Text(header[1],
                    style: pdfWidget.TextStyle(fontSize: 12)),
              ),
              pdfWidget.Expanded(
                flex: 2,
                child: pdfWidget.Text(header[2],
                    style: pdfWidget.TextStyle(fontSize: 12)),
              ),
              pdfWidget.Expanded(
                flex: 2,
                child: pdfWidget.Text(header[3],
                    style: pdfWidget.TextStyle(fontSize: 12)),
              ),
              pdfWidget.Expanded(
                flex: 2,
                child: pdfWidget.Text(header[4],
                    style: pdfWidget.TextStyle(fontSize: 12)),
              ),
            ]),
          ),
          pdfWidget.Center(
            child: pdfWidget.Padding(
                padding:
                    pdfWidget.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: pdfWidget.Divider(
                  height: 1,
                  thickness: 1,
                )),
          ),
          pdfWidget.Padding(
            padding:
                pdfWidget.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: pdfWidget.Table(children: [
              for (int i = 0; i < isi_data.length; i++)
                pdfWidget.TableRow(
                  children: [
                    pdfWidget.Expanded(
                      flex: 2,
                      child: pdfWidget.Text(isi_data[i]['a'].toString(),
                          style: pdfWidget.TextStyle(fontSize: 12)),
                    ),
                    pdfWidget.Expanded(
                      flex: 2,
                      child: pdfWidget.Text(isi_data[i]['b'].toString(),
                          style: pdfWidget.TextStyle(fontSize: 12)),
                    ),
                    pdfWidget.Expanded(
                      flex: 2,
                      child: pdfWidget.Text(isi_data[i]['c'].toString(),
                          style: pdfWidget.TextStyle(fontSize: 12)),
                    ),
                    pdfWidget.Expanded(
                      flex: 2,
                      child: pdfWidget.Text(isi_data[i]['d'].toString(),
                          style: pdfWidget.TextStyle(fontSize: 12)),
                    ),
                    pdfWidget.Expanded(
                      flex: 2,
                      child: pdfWidget.Text(isi_data[i]['e'].toString(),
                          style: pdfWidget.TextStyle(fontSize: 12)),
                    ),
                  ],
                )
            ]),
          ),
          pdfWidget.Center(
            child: pdfWidget.Padding(
                padding:
                    pdfWidget.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: pdfWidget.Divider(
                  height: 1,
                  thickness: 1,
                )),
          ),
        ],
      );
    },
  ));

  final Directory directory =
      await path_provider.getApplicationDocumentsDirectory();
  final String path = directory.path;
  final File file = File('$path/$title.pdf');
  await file.writeAsBytes(await pdf.save());
  BotToast.closeAllLoading();
  await open_file.OpenFile.open('$path/$title.pdf');
}
