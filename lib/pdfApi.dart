import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final pdf = Document();
    pdf.addPage(Page(build: (context) => Center(child: Text(text))));
    return saveDocument(name: "My sample pdf", pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    print(file);
    return file;
  }

  static Future<void> openFile(File file) async {
    try {
      final url = file.path;
      print('File path: $url');
      final result = await OpenFile.open(url);
      print('OpenFile result: ${result.message}');
    } catch (e) {
      print('Error opening file: $e');
    }
  }

// pw.SizedBox(
//   //height: 305,
//   child: pw.Row(
//     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: pw.CrossAxisAlignment.start,
//     children: [
//       pw.Expanded(
//           child: pw.Container(
//               decoration: pw.BoxDecoration(
//                   border: pw.Border.all(
//                       color: PdfColor.fromHex("#22B395"))),
//               child: pw.ListView.builder(
//                   itemCount: clientData.length,
//                   itemBuilder: (context, index) {
//                     return pw.Container(
//                         decoration: pw.BoxDecoration(
//                             border: pw.Border.all(
//                                 color: PdfColor.fromHex("#22B395"),
//                                 width: 2)),
//                         child: pw.Row(children: [
//                           pw.Expanded(
//                               child: pw.Container(
//                                   height: 33,
//                                   margin: const pw.EdgeInsets.all(5),
//                                   color: PdfColor.fromHex("#22B395"),
//                                   child: pw.Column(
//                                       mainAxisAlignment:
//                                           pw.MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           pw.CrossAxisAlignment.start,
//                                       children: [
//                                         pw.Text(
//                                             "   ${clientData[index]["name"]}",
//                                             style: const pw.TextStyle(
//                                                 color:
//                                                     PdfColors.white))
//                                       ]))),
//                           pw.Container(
//                               //height: 308,
//                               width: 2,
//                               color: PdfColor.fromHex("#22B395")),
//                           pw.Expanded(
//                               child: pw.Container(
//                                   child: pw.Column(
//                                       mainAxisAlignment:
//                                           pw.MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           pw.CrossAxisAlignment.start,
//                                       children: [
//                                 pw.Text(
//                                     "   ${clientData[index]["data"]}")
//                               ])))
//                         ]));
//                   }))),
//       pw.SizedBox(width: 15),
//       pw.Expanded(
//           child: pw.Container(
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text(
//                 'NEAR AZHAKODI TEMPLE, V PANOLI ROAD 5/268,\nCHEROOTY NAGAR , CALICUT 673004',
//                 textAlign: pw.TextAlign.center,
//                 style: pw.TextStyle(fontSize: 10, font: customFont)),
//             pw.SizedBox(height: 10),
//             pw.Row(
//               mainAxisSize: pw.MainAxisSize.min,
//               mainAxisAlignment: pw.MainAxisAlignment.start,
//               children: [
//                 pw.Image(telephone, height: 12, width: 12),
//                 pw.Text(" 0495 5666455",
//                     style:
//                         pw.TextStyle(fontSize: 10, font: customFont)),
//                 pw.SizedBox(
//                   width: 5,
//                 ),
//                 pw.Image(mobile, height: 12, width: 12),
//                 pw.Text(
//                   " 9992888881, 7555433551",
//                   style: pw.TextStyle(fontSize: 10, font: customFont),
//                   overflow: pw.TextOverflow.clip,
//                 ),
//               ],
//             ),
//             pw.Text(
//               " 999288888, 755543355, 9087665566",
//               style: pw.TextStyle(fontSize: 10, font: customFont),
//             ),
//             pw.SizedBox(height: 30),
//             pw.Row(children: [
//               pw.Image(qrCode,
//                   height: 60, width: 60, fit: pw.BoxFit.cover),
//               pw.SizedBox(width: 10),
//               pw.Expanded(
//                   child: pw.Column(children: [
//                 pw.Row(
//                     mainAxisAlignment:
//                         pw.MainAxisAlignment.spaceBetween,
//                     children: [
//                       pw.Row(children: [
//                         pw.Image(instagram, height: 17, width: 17),
//                         pw.Text("  MGFEVENT",
//                             style: pw.TextStyle(
//                                 fontSize: 7, font: customFont))
//                       ]),
//                       pw.Row(children: [
//                         pw.Image(facebook, height: 17, width: 17),
//                         pw.Text("  MGFEVENTS",
//                             style: pw.TextStyle(
//                                 fontSize: 7, font: customFont))
//                       ]),
//                       pw.Row(children: [
//                         pw.Image(youtube, height: 17, width: 17),
//                         pw.Text("  MGFEVENTS",
//                             style: pw.TextStyle(
//                                 fontSize: 7, font: customFont))
//                       ])
//                     ]),
//                 pw.SizedBox(height: 10),
//                 pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.center,
//                     children: [
//                       pw.Row(children: [
//                         pw.Image(website, height: 17, width: 17),
//                         pw.Text("  WWW.MGFEVENT.COM",
//                             style: pw.TextStyle(
//                                 fontSize: 7, font: customFont))
//                       ]),
//                       pw.SizedBox(width: 20),
//                       pw.Row(children: [
//                         pw.Image(twitter, height: 17, width: 17),
//                         pw.Text("  @MGF_events",
//                             style: pw.TextStyle(
//                                 fontSize: 7, font: customFont))
//                       ]),
//                     ])
//               ]))
//             ]),
//             pw.SizedBox(height: 20),
//
//             pw.Container(
//                 decoration: pw.BoxDecoration(
//                     border: pw.Border.all(
//                         color: PdfColor.fromHex("#22B395"))),
//                 child: pw.ListView.builder(
//                     itemCount: 2,
//                     itemBuilder: (context, index) {
//                       return pw.Container(
//                           decoration: pw.BoxDecoration(
//                               border: pw.Border.all(
//                                   color: PdfColor.fromHex("#22B395"),
//                                   width: 2)),
//                           child: pw.Row(children: [
//                             pw.Expanded(
//                                 child: pw.Container(
//                                     height: 33,
//                                     margin:
//                                         const pw.EdgeInsets.all(5),
//                                     color:
//                                         PdfColor.fromHex("#22B395"),
//                                     child: pw.Column(
//                                         mainAxisAlignment: pw
//                                             .MainAxisAlignment.center,
//                                         crossAxisAlignment: pw
//                                             .CrossAxisAlignment.start,
//                                         children: [
//                                           pw.Text(
//                                               "   ${clientData[index]["name"]}",
//                                               style:
//                                                   const pw.TextStyle(
//                                                       color: PdfColors
//                                                           .white))
//                                         ]))),
//                             pw.Container(
//                                 //height: 308,
//                                 width: 2,
//                                 color: PdfColor.fromHex("#22B395")),
//                             pw.Expanded(
//                                 child: pw.Container(
//                                     child: pw.Column(
//                                         mainAxisAlignment: pw
//                                             .MainAxisAlignment.center,
//                                         crossAxisAlignment: pw
//                                             .CrossAxisAlignment.start,
//                                         children: [
//                                   pw.Text(
//                                       "   ${clientData[index]["data"]}")
//                                 ])))
//                           ]));
//                     }))
//           ],
//         ),
//       ))
//     ],
//   ),
// ),
}
