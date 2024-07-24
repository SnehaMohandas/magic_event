import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indian_currency_to_word/indian_currency_to_word.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = List.generate(
    20,
    (index) => {"name": "Item ${index + 1}", "price": (index + 1) * 10.0},
  );

  InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invoice')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Item')),
                  DataColumn(label: Text('Price')),
                ],
                rows: items
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item['name'])),
                          DataCell(Text(item['price'].toString())),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _generateAndSharePDF(context),
              child: const Text('Share PDF'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateAndSharePDF(BuildContext context) async {
    final pdf = pw.Document();
    final List<Map<String, dynamic>> clientData = [
      {
        "name": "Quotation No",
        "data": "102",
      },
      {
        "name": "Quotation Date",
        "data": "20-03-2024",
      },
      {"name": "Event Date", "data": "25-03-2024"},
      {"name": "Event Time", "data": "10.00 AM"},
      {"name": "Venue", "data": "White Castle"},
      {"name": "Type of Event", "data": "Birthday"},
      {"name": "Client Name", "data": "Sneha"},
      {"name": "Client Address", "data": "Calicut"},
      {"name": "Client GST No", "data": "0"},
      {"name": "Remarks", "data": "0"},
    ];
    final List<Map<String, dynamic>> particulars = [
      {
        "item": "Stage Decor",
        "quantity": "1",
        "rate": 5000.00,
        "amount": 55000.00
      },
      {
        "item": "Maala and bouquet",
        "quantity": "2",
        "rate": 6000.00,
        "amount": 6000.00
      },
      {
        "item": "Nadaswaram",
        "quantity": "1",
        "rate": 8000.00,
        "amount": 8000.00
      },
      {"item": "Chaadar", "quantity": "1", "rate": 4000.00, "amount": 4000.00},
      {
        "item": "Welcome bouquet",
        "quantity": "2",
        "rate": 4000.00,
        "amount": 4000.00
      },
      {
        "item": "Car Decor",
        "quantity": "1",
        "rate": 5000.00,
        "amount": 5000.00
      },
    ];

    List<Map<String, dynamic>> totals = [
      {
        "type": "Sub Total",
        "amount": 1400.0,
      },
      {
        "type": "Coordination Charge (10%)",
        "coordinationCharge": 600.0,
      },
      {"type": "Total", "total": 2000.0}
    ];
    // Load the logo image
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    final qrCode = pw.MemoryImage(
      (await rootBundle.load('assets/images/qrcode.png')).buffer.asUint8List(),
    );
    final mobile = pw.MemoryImage(
      (await rootBundle.load('assets/images/mobile.png')).buffer.asUint8List(),
    );
    final telephone = pw.MemoryImage(
      (await rootBundle.load('assets/images/telephone.png'))
          .buffer
          .asUint8List(),
    );
    final twitter = pw.MemoryImage(
      (await rootBundle.load('assets/images/twitter.png')).buffer.asUint8List(),
    );
    final instagram = pw.MemoryImage(
      (await rootBundle.load('assets/images/instagram.png'))
          .buffer
          .asUint8List(),
    );
    final facebook = pw.MemoryImage(
      (await rootBundle.load('assets/images/facebook.png'))
          .buffer
          .asUint8List(),
    );
    final website = pw.MemoryImage(
      (await rootBundle.load("assets/images/website.png")).buffer.asUint8List(),
    );
    final youtube = pw.MemoryImage(
      (await rootBundle.load("assets/images/youtube.png")).buffer.asUint8List(),
    );
    final rupee = pw.MemoryImage(
      (await rootBundle.load("assets/images/rupee.png")).buffer.asUint8List(),
    );
    final mail = pw.MemoryImage(
      (await rootBundle.load("assets/images/email_6217585.png"))
          .buffer
          .asUint8List(),
    );

    final fontData =
        await rootBundle.load('assets/fonts/CutiveMono-Regular.ttf');

    final customFont = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) => [
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
            pw.Container(
              height: 130,
              width: 130,
              child: pw.Image(logoImage,
                  width: 130, height: 130, fit: pw.BoxFit.cover),
            ),
            pw.SizedBox(width: 40),
            pw.Container(height: 100, width: 1, color: PdfColors.black)
            // pw.VerticalDivider(
            //     thickness: 2, color: PdfColors.black, width: 4),
            ,
            pw.SizedBox(width: 40),
            pw.Text("QUOTATION", style: pw.TextStyle(fontSize: 16))
          ]),
          pw.SizedBox(height: 30),
          pw.Expanded(
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Orange Container
                pw.Expanded(
                    child: pw.Container(
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                      pw.ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return pw.Container(
                                decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#b34e42"),
                                        width: 2)),
                                child: pw.Row(children: [
                                  pw.Expanded(
                                      child: pw.Container(
                                          height: 33,
                                          margin: const pw.EdgeInsets.all(5),
                                          color: PdfColor.fromHex("#b34e42"),
                                          child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Text(
                                                    "   ${clientData[index]["name"]}",
                                                    style: const pw.TextStyle(
                                                        color: PdfColors.white))
                                              ]))),
                                  pw.Expanded(
                                      child: pw.Container(
                                          child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                        pw.Text(
                                            "   ${clientData[index]["data"]}",
                                            style: pw.TextStyle(
                                                fontWeight: pw.FontWeight.bold))
                                      ])))
                                ]));
                          })
                    ]))),
                pw.SizedBox(width: 20),
                // Red Container
                pw.Expanded(
                  child: pw.Container(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      mainAxisSize: pw.MainAxisSize.max,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text(
                            'NEAR AZHAKODI TEMPLE, V PANOLI ROAD 5/268,\nCHEROOTY NAGAR , CALICUT 673004',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 10,
                              font: customFont,
                            )),
                        pw.Row(
                          mainAxisSize: pw.MainAxisSize.max,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Column(children: [
                              pw.Row(children: [
                                pw.Image(telephone, height: 12, width: 12),
                                pw.Text(" 0495 5666455",
                                    style: pw.TextStyle(
                                        fontSize: 11, font: customFont)),
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Image(mobile, height: 12, width: 12),
                                pw.Text(
                                  " 9992888881, 7555433551,",
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    font: customFont,
                                  ),
                                  overflow: pw.TextOverflow.clip,
                                ),
                              ]),
                              pw.Text(
                                " 999288888, 755543355, 9087665566",
                                style: pw.TextStyle(
                                    fontSize: 11, font: customFont),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Row(children: [
                                pw.Image(mail,
                                    height: 14,
                                    width: 14,
                                    fit: pw.BoxFit.cover),
                                pw.Text(
                                  " info@mgfevent.com,mgfeventcalicut@gmail.com",
                                  style: pw.TextStyle(
                                    fontSize: 9,
                                    font: customFont,
                                  ),
                                )
                              ])
                            ])
                          ],
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(mainAxisSize: pw.MainAxisSize.max, children: [
                          pw.Image(qrCode,
                              height: 60, width: 60, fit: pw.BoxFit.cover),
                          pw.SizedBox(width: 10),
                          pw.Column(children: [
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Row(children: [
                                    pw.Image(instagram, height: 17, width: 17),
                                    pw.Text(" MGFEVENT  ",
                                        style: pw.TextStyle(
                                            fontSize: 7, font: customFont))
                                  ]),
                                  pw.Row(children: [
                                    pw.Image(facebook, height: 17, width: 17),
                                    pw.Text(" MGFEVENTS  ",
                                        style: pw.TextStyle(
                                            fontSize: 7, font: customFont))
                                  ]),
                                  pw.Row(children: [
                                    pw.Image(youtube, height: 17, width: 17),
                                    pw.Text(" MGFEVENTS",
                                        style: pw.TextStyle(
                                            fontSize: 7, font: customFont))
                                  ])
                                ]),
                            pw.SizedBox(height: 10),
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Row(children: [
                                    pw.Image(website, height: 17, width: 17),
                                    pw.Text(" WWW.MGFEVENT.COM",
                                        style: pw.TextStyle(
                                            fontSize: 7, font: customFont))
                                  ]),
                                  pw.SizedBox(width: 20),
                                  pw.Row(children: [
                                    pw.Image(twitter, height: 17, width: 17),
                                    pw.Text(" @MGF_events",
                                        style: pw.TextStyle(
                                            fontSize: 7, font: customFont))
                                  ]),
                                ])
                          ])
                        ]),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            decoration: const pw.BoxDecoration(
                                // border: pw.Border.all(
                                //     color: PdfColor.fromHex("#22B395"))
                                ),
                            child: pw.ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return pw.Container(
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color:
                                                  PdfColor.fromHex("#b34e42"),
                                              width: 2)),
                                      child: pw.Row(children: [
                                        pw.Expanded(
                                            child: pw.Container(
                                                height: 33,
                                                margin:
                                                    const pw.EdgeInsets.all(5),
                                                color:
                                                    PdfColor.fromHex("#b34e42"),
                                                child: pw.Column(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Text(
                                                          "   ${clientData[index + 8]["name"]}",
                                                          style: const pw
                                                              .TextStyle(
                                                              color: PdfColors
                                                                  .white))
                                                    ]))),
                                        pw.Expanded(
                                            child: pw.Container(
                                                child: pw.Column(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                              pw.Text(
                                                  "   ${clientData[index + 8]["data"]}",
                                                  style: pw.TextStyle(
                                                      fontWeight:
                                                          pw.FontWeight.bold))
                                            ])))
                                      ]));
                                }))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 70),
          pw.Table(
            columnWidths: {
              0: const pw.FixedColumnWidth(50), // First column width
              1: const pw.FlexColumnWidth(
                  200), // Second column width (flexible)
              2: const pw.FlexColumnWidth(50),
              3: const pw.FlexColumnWidth(70),
              4: const pw.FlexColumnWidth(70),
            },
            border: pw.TableBorder.all(width: 1, color: PdfColors.grey200),
            children: [
              // Header Row
              pw.TableRow(
                decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex("#b34e42"),
                ),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('NO',
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('PARTICULARS',
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('QTY',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('RATE',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('AMOUNT',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                ],
              ),
              // Data Rows
              ...List.generate(particulars.length, (index) {
                final item = particulars[index];
                return pw.TableRow(
                  decoration: const pw.BoxDecoration(
                    border: pw.Border(
                        bottom:
                            pw.BorderSide(width: 0.5, color: PdfColors.grey)),
                  ),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text((index + 1).toString()), // Item number
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(item['item']),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(item['quantity'],
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                          left: 8, top: 8, bottom: 8, right: 12),
                      child: pw.Text(item['rate'].toString(),
                          textAlign: pw.TextAlign.end),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                          left: 8, top: 8, bottom: 8, right: 12),
                      child: pw.Text(item['amount'].toString(),
                          textAlign: pw.TextAlign.end),
                    ),
                  ],
                );
              }),
            ],
          ),
          pw.Container(
              height: 30,
              width: double.infinity,
              decoration: const pw.BoxDecoration(
                  border: pw.Border(
                      right: pw.BorderSide(color: PdfColors.grey200),
                      left: pw.BorderSide(color: PdfColors.grey200),
                      bottom: pw.BorderSide(color: PdfColors.grey200))),
              child: pw.Row(children: [
                pw.Container(
                  width: 457,
                  child: pw.Text("Sub Total",
                      textAlign: pw.TextAlign.end,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(
                    height: 30,
                    child: pw.VerticalDivider(
                      color: PdfColors.grey200,
                    )),
                pw.Expanded(
                    child: pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 8, left: 8, bottom: 8, right: 12),
                        child: pw.Text(
                          particulars
                              .fold<double>(
                                  0,
                                  (sum, item) =>
                                      sum + (item['amount'] as double))
                              .toStringAsFixed(2),
                          textAlign: pw.TextAlign.end,
                        )))
              ])),
          pw.Container(
              height: 30,
              width: double.infinity,
              decoration: const pw.BoxDecoration(
                  border: pw.Border(
                      right: pw.BorderSide(color: PdfColors.grey200),
                      left: pw.BorderSide(color: PdfColors.grey200),
                      bottom: pw.BorderSide(color: PdfColors.grey200))),
              child: pw.Row(children: [
                pw.Container(
                    width: 457,
                    child: pw.Text("Coordination Charge (10%)",
                        textAlign: pw.TextAlign.end,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.SizedBox(
                    height: 30,
                    child: pw.VerticalDivider(
                      color: PdfColors.grey200,
                    )),
                pw.Expanded(
                    child: pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 8, left: 8, bottom: 8, right: 12),
                        child: pw.Text(
                            (particulars.fold<double>(
                                        0,
                                        (sum, item) =>
                                            sum + (item['amount'] as double)) *
                                    0.10)
                                .toStringAsFixed(2),
                            textAlign: pw.TextAlign.end)))
              ])),
          pw.Container(
              height: 45,
              width: double.infinity,
              decoration: const pw.BoxDecoration(
                  border: pw.Border(
                      right: pw.BorderSide(color: PdfColors.grey200),
                      left: pw.BorderSide(color: PdfColors.grey200),
                      bottom: pw.BorderSide(color: PdfColors.grey200))),
              child: pw.Row(children: [
                pw.Container(
                  width: 360,
                  child: pw.Text("TOTAL ",
                      textAlign: pw.TextAlign.end,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 20)),
                ),
                pw.SizedBox(
                    height: 45,
                    child: pw.VerticalDivider(
                      color: PdfColors.grey200,
                    )),
                pw.Expanded(
                    child: pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 8, left: 8, bottom: 8, right: 12),
                        child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                              pw.Image(rupee,
                                  height: 15, width: 15, fit: pw.BoxFit.cover),
                              pw.Text("90200.00",
                                  textAlign: pw.TextAlign.end,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 20))
                            ]))),
              ])),
          pw.SizedBox(height: 20),
          pw.Align(
              alignment: pw.Alignment.topRight,
              child: pw.Text("(${AmountToWords().convertAmountToWords(90200)})",
                  textAlign: pw.TextAlign.end,
                  style: pw.TextStyle(color: PdfColors.red))),
          pw.SizedBox(height: 10),
          pw.Text("Terms and Conditions",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text(
              "* WE REQUEST YOU TO GRANT THE PERMISSION FOR PROMOTIONAL WORKS IN SOCIAL MEDIAS FROM MGF EVENTS.",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text(
            "1. The busget estimates. Any other additional facilities & services to support the event will be charged at actual\n\n"
            "2. All payments to be made in favour of M?s. MGFEVENTS.\n\n"
            "3. Any damage occured to our materials by participats will be changed at actual\n\n"
            "4. above rates are valid for 20 days only\n\n"
            "5. All items mentioned above are on rental basis for this event only\n\n"
            "6. 75% advance should be paid at the time of confirmation and balance on the event day\n\n"
            "7. Union charges if any will be at actual and have to be born or reimbursed by client\n\n"
            "8. GST 18% extra will charge on final amount\n\n"
            "9. Coordination charge 10 % extra will charge on final amount",
          ),
          pw.SizedBox(height: 40),
          pw.Text("Privacy Policy",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text(
              "MGF Events takes the privacy of its users and subscribers seriously. We are committed to safeguarding the privacy of our users while providing a personalised and valiuable service. The privacy policy statement explains the data processing practices of MGF events. If you have any request s concerning your personal information, wish to make any amendment to your personal information or have any queries with regard to these practices please contact to our team by email at info@mgfeven.com or mobile +91 9345555566",
              style: pw.TextStyle(lineSpacing: 6)),
          pw.SizedBox(height: 80),
          pw.Center(
              child: pw.Text("THANK YOU",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex("#b34e42"),
                      fontSize: 25))),
        ],
      ),
    );

    // final output = await getTemporaryDirectory();
    // final file = File("${output.path}/invoice.pdf");
    // await file.writeAsBytes(await pdf.save());
    //
    // await Share.shareFiles([file.path], text: 'Invoice PDF');

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF file
    await OpenFile.open(file.path);
  }
}
