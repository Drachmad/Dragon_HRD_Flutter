import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class printer {
  List data = [];
  Future<void> ambilData(String no_bukti) async {
    data = [];
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    await ambilData('SL2112-1');
    print(data);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              //header
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 100,
                    child: pw.Text('Kepada Yth. ' + data[0]['customer']),
                  ),
                  pw.SizedBox(width: 16),
                  pw.Container(
                    width: 100,
                    child: pw.Text('No. ' + data[0]['no_bukti']),
                  ),
                  pw.SizedBox(width: 16),
                  pw.Container(
                    width: 100,
                    child: pw.Text('Jatuh Tempo. ' + data[0]['jatuh_tempo']),
                  ),
                ],
              ),
              pw.Divider(),
              pw.SizedBox(height: 20),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  Future<void> print_(String title) async {
    print('dijalan');
    Directory directory = await getApplicationDocumentsDirectory();
    final file = File(directory.path + '\\example1.pdf');
    var tmp = await _generatePdf(PdfPageFormat.a5, title);
    print(directory.path + '\\example1.pdf');
    await file.writeAsBytes(tmp);
    print('selesai');
  }
}
