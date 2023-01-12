import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfApi {
  static Future openFile(File file) async {
    // final PDFViewController _controler;
    final url = file.path;

    try {
      await OpenFile.open(url);
    } catch (e) {
      print(e.toString());
    }
    // showDialog(
    //     useSafeArea: true,
    //     context: context,
    //     builder: (_) {
    //       return PDFView(
    //         filePath: url,
    //         enableSwipe: true,
    //         autoSpacing: false,
    //         pageFling: false,
    //         fitEachPage: false,
    //         onError: (error) {
    //           debugPrint(error);
    //         },
    //         onPageError: (page, error) {
    //           debugPrint(error);
    //         },
    //         onViewCreated: (controler) {
    //           // _controler.complete();
    //         },
    //       );
    //     });
  }

  static Future<File> generateTable() async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    // final headers = ['Name', 'age'];
    // final users = [
    //   User(name: 'salman', age: 26),
    //   User(name: 'khallid', age: 22),
    //   User(name: 'ishaq', age: 25)
    // ];

    // final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(pw.MultiPage(
        // footer: (_) {},
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.symmetric(horizontal: 10),
        header: (_) {
          return pw.Header(
              child: pw.Column(children: [
            pw.Text('Invoice', style: pw.TextStyle(fontSize: 25, font: font)),
            pw.Text('Invoice Id # INV0987',
                style: pw.TextStyle(fontSize: 25, font: font)),
            pw.SizedBox(height: 10),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('invoice Date',
                      style: pw.TextStyle(fontSize: 25, font: font)),
                  pw.Text('11/12/12',
                      style: pw.TextStyle(fontSize: 25, font: font))
                ]),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Due Date',
                      style: pw.TextStyle(fontSize: 25, font: font)),
                  pw.Text('11/12/12',
                      style: pw.TextStyle(fontSize: 25, font: font))
                ])
          ]));
        },
        build: (context) {
          return [
            pw.Container(
                // padding:  pw.EdgeInsets.symmetric(horizontal: 20),
                child: pw.Column(children: [
              pw.SizedBox(height: 30),
              pw.Table(

                  // tableWidth: pw.TableWidth.min,
                  children: [
                    pw.TableRow(children: [
                      pw.Text('Build By',
                          style: pw.TextStyle(
                              fontSize: 25,
                              color: PdfColors.blue600,
                              font: font)),
                      pw.Text('Build By',
                          style: pw.TextStyle(
                              fontSize: 25,
                              color: PdfColors.blue600,
                              font: font))
                    ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(horizontal: 10),
                            child: pw.Text('Khalid',
                                style: pw.TextStyle(fontSize: 25, font: font)),
                          ),
                          pw.Text('Salman',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('Email: xyz@gmail.com',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('Email: xyz@gmail.com',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('Address: smilah swabi',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('Address: smilah swabi',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('phone: 0987',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('phone: 0987',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                  ]),
              pw.Table(children: [
                pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    decoration: pw.BoxDecoration(color: PdfColors.teal),
                    children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          child: pw.Text('S.No',
                              style: pw.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.white,
                                  font: font))),
                      pw.SizedBox(width: 20),
                      pw.Text('Item Name',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.Text('Quantity',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 50),
                      pw.Text('Item Price',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 20),
                      pw.Text('Total Price',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 10),
                    ]),
                pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    decoration: pw.BoxDecoration(color: PdfColors.amber100),
                    children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          child: pw.Text('01',
                              style: pw.TextStyle(fontSize: 20, font: font))),
                      pw.SizedBox(width: 20),
                      pw.Text('Chae',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.Text('10',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 50),
                      pw.Text('50',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 20),
                      pw.Text('500',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 10),
                    ])
              ]),
              pw.SizedBox(height: 20),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Description',
                              style: pw.TextStyle(
                                  fontSize: 25,
                                  font: font,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 70),
                          pw.Text('Term and Condition',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('1.',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.Column(children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          width: 300,
                          decoration: pw.BoxDecoration(color: PdfColors.orange),
                          child: pw.Text('Total Summary',
                              style: pw.TextStyle(
                                  fontSize: 25,
                                  color: PdfColors.white,
                                  font: font))),
                      pw.Container(
                          padding: pw.EdgeInsets.symmetric(horizontal: 10),
                          alignment: pw.Alignment.center,
                          height: 220,
                          width: 300,
                          decoration: pw.BoxDecoration(color: PdfColors.grey),
                          child: pw.Column(children: [
                            pw.SizedBox(height: 30),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Total (Exc Tax, Disc)',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('500 PKR',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Discount',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('0 %',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Tax',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('10 %',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text(
                                          'Sub Total(incl tax, Dis) ',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('500 PKR)',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ])
                          ]))
                    ])
                  ]),
            ])),
            pw.Container(
                // padding:  pw.EdgeInsets.symmetric(horizontal: 20),
                child: pw.Column(children: [
              pw.SizedBox(height: 30),
              pw.Table(

                  // tableWidth: pw.TableWidth.min,
                  children: [
                    pw.TableRow(children: [
                      pw.Text('Build By',
                          style: pw.TextStyle(
                              fontSize: 25,
                              color: PdfColors.blue600,
                              font: font)),
                      pw.Text('Build By',
                          style: pw.TextStyle(
                              fontSize: 25,
                              color: PdfColors.blue600,
                              font: font))
                    ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('Khalid',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('Salman',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('Email: xyz@gmail.com',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('Email: xyz@gmail.com',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('Address: smilah swabi',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('Address: smilah swabi',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.yellow),
                        children: [
                          pw.Text('phone: 0987',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('phone: 0987',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                  ]),
              pw.Table(children: [
                pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    decoration: pw.BoxDecoration(color: PdfColors.teal),
                    children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          child: pw.Text('S.No',
                              style: pw.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.white,
                                  font: font))),
                      pw.SizedBox(width: 20),
                      pw.Text('Item Name',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.Text('Quantity',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 50),
                      pw.Text('Item Price',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 20),
                      pw.Text('Total Price',
                          style: pw.TextStyle(
                              fontSize: 20,
                              color: PdfColors.white,
                              font: font)),
                      pw.SizedBox(width: 10),
                    ]),
                pw.TableRow(
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    decoration: pw.BoxDecoration(color: PdfColors.amber100),
                    children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          child: pw.Text('01',
                              style: pw.TextStyle(fontSize: 20, font: font))),
                      pw.SizedBox(width: 20),
                      pw.Text('Chae',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.Text('10',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 50),
                      pw.Text('50',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 20),
                      pw.Text('500',
                          style: pw.TextStyle(fontSize: 20, font: font)),
                      pw.SizedBox(width: 10),
                    ])
              ]),
              pw.SizedBox(height: 20),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Description',
                              style: pw.TextStyle(
                                  fontSize: 25,
                                  fontWeight: pw.FontWeight.bold,
                                  font: font)),
                          pw.SizedBox(height: 70),
                          pw.Text('Term and Condition',
                              style: pw.TextStyle(fontSize: 25, font: font)),
                          pw.Text('1.',
                              style: pw.TextStyle(fontSize: 25, font: font))
                        ]),
                    pw.Column(children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          height: 50,
                          width: 300,
                          decoration: pw.BoxDecoration(color: PdfColors.orange),
                          child: pw.Text('Total Summary',
                              style: pw.TextStyle(
                                  fontSize: 25,
                                  color: PdfColors.white,
                                  font: font))),
                      pw.Container(
                          padding: pw.EdgeInsets.symmetric(horizontal: 10),
                          alignment: pw.Alignment.center,
                          height: 220,
                          width: 300,
                          decoration: pw.BoxDecoration(color: PdfColors.grey),
                          child: pw.Column(children: [
                            pw.SizedBox(height: 30),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Total (Exc Tax, Disc)',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('500 PKR',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Discount)',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('0 %',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text('Tax',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('10 %',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Flexible(
                                      child: pw.Text(
                                          'Sub Total(incl tax, Dis) ',
                                          style: pw.TextStyle(
                                              fontSize: 20, font: font))),
                                  pw.Text('500 PKR)',
                                      style: pw.TextStyle(
                                          fontSize: 20, font: font))
                                ])
                          ]))
                    ])
                  ]),
            ]))
          ];
        }));

    // pdf.addPage(

    //   pw.Page(

    //     margin: pw.EdgeInsets.all(10),
    //     clip: true,
    //     build: (context) {
    //       return pw.Container(
    //           // padding:  pw.EdgeInsets.symmetric(horizontal: 20),
    //           child: pw.Column(children: [
    //         pw.Header(
    //             child: pw.Column(children: [
    //           pw.Text('Invoice', style:  pw.TextStyle(fontSize: 25)),
    //           pw.Text('Invoice Id # INV0987',
    //               style:  pw.TextStyle(fontSize: 25)),
    //           pw.SizedBox(height: 10),
    //           pw.Row(
    //               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //               children: [
    //                 pw.Text('invoice Date',
    //                     style:  pw.TextStyle(fontSize: 25)),
    //                 pw.Text('11/12/12', style:  pw.TextStyle(fontSize: 25))
    //               ]),
    //           pw.Row(
    //               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //               children: [
    //                 pw.Text('Due Date',
    //                     style:  pw.TextStyle(fontSize: 25)),
    //                 pw.Text('11/12/12', style:  pw.TextStyle(fontSize: 25))
    //               ])
    //         ])),
    //         pw.SizedBox(height: 30),
    //         pw.Table(

    //             // tableWidth: pw.TableWidth.min,
    //             children: [
    //               pw.TableRow(children: [
    //                 pw.Text('Build By',
    //                     style:  pw.TextStyle(
    //                         fontSize: 25, color: PdfColors.blue600)),
    //                 pw.Text('Build By',
    //                     style:  pw.TextStyle(
    //                         fontSize: 25, color: PdfColors.blue600))
    //               ]),
    //               pw.TableRow(
    //                   decoration:
    //                        pw.BoxDecoration(color: PdfColors.yellow),
    //                   children: [
    //                     pw.Text('Khalid',
    //                         style:  pw.TextStyle(
    //                           fontSize: 25,
    //                         )),
    //                     pw.Text('Salman',
    //                         style:  pw.TextStyle(fontSize: 25))
    //                   ]),
    //               pw.TableRow(
    //                   decoration:
    //                        pw.BoxDecoration(color: PdfColors.yellow),
    //                   children: [
    //                     pw.Text('Email: xyz@gmail.com',
    //                         style:  pw.TextStyle(
    //                           fontSize: 25,
    //                         )),
    //                     pw.Text('Email: xyz@gmail.com',
    //                         style:  pw.TextStyle(fontSize: 25))
    //                   ]),
    //               pw.TableRow(
    //                   decoration:
    //                        pw.BoxDecoration(color: PdfColors.yellow),
    //                   children: [
    //                     pw.Text('Address: smilah swabi',
    //                         style:  pw.TextStyle(
    //                           fontSize: 25,
    //                         )),
    //                     pw.Text('Address: smilah swabi',
    //                         style:  pw.TextStyle(fontSize: 25))
    //                   ]),
    //               pw.TableRow(
    //                   decoration:
    //                        pw.BoxDecoration(color: PdfColors.yellow),
    //                   children: [
    //                     pw.Text('phone: 0987',
    //                         style:  pw.TextStyle(
    //                           fontSize: 25,
    //                         )),
    //                     pw.Text('phone: 0987',
    //                         style:  pw.TextStyle(fontSize: 25))
    //                   ]),
    //             ]),
    //         pw.Table(children: [
    //           pw.TableRow(
    //               verticalAlignment: pw.TableCellVerticalAlignment.middle,
    //               decoration:  pw.BoxDecoration(color: PdfColors.teal),
    //               children: [
    //                 pw.Container(
    //                     alignment: pw.Alignment.center,
    //                     height: 50,
    //                     child: pw.Text('S.No',
    //                         style:  pw.TextStyle(
    //                             fontSize: 20, color: PdfColors.white))),
    //                 pw.SizedBox(width: 20),
    //                 pw.Text('Item Name',
    //                     style:  pw.TextStyle(
    //                         fontSize: 20, color: PdfColors.white)),
    //                 pw.Text('Quantity',
    //                     style:  pw.TextStyle(
    //                         fontSize: 20, color: PdfColors.white)),
    //                 pw.SizedBox(width: 50),
    //                 pw.Text('Item Price',
    //                     style:  pw.TextStyle(
    //                         fontSize: 20, color: PdfColors.white)),
    //                 pw.SizedBox(width: 20),
    //                 pw.Text('Total Price',
    //                     style:  pw.TextStyle(
    //                         fontSize: 20, color: PdfColors.white)),
    //                 pw.SizedBox(width: 10),
    //               ]),
    //           pw.TableRow(
    //               verticalAlignment: pw.TableCellVerticalAlignment.middle,
    //               decoration:  pw.BoxDecoration(color: PdfColors.amber100),
    //               children: [
    //                 pw.Container(
    //                     alignment: pw.Alignment.center,
    //                     height: 50,
    //                     child: pw.Text('01',
    //                         style:  pw.TextStyle(
    //                           fontSize: 20,
    //                         ))),
    //                 pw.SizedBox(width: 20),
    //                 pw.Text('Chae', style:  pw.TextStyle(fontSize: 20)),
    //                 pw.Text('10', style:  pw.TextStyle(fontSize: 20)),
    //                 pw.SizedBox(width: 50),
    //                 pw.Text('50', style:  pw.TextStyle(fontSize: 20)),
    //                 pw.SizedBox(width: 20),
    //                 pw.Text('500', style:  pw.TextStyle(fontSize: 20)),
    //                 pw.SizedBox(width: 10),
    //               ])
    //         ]),
    //         pw.SizedBox(height: 20),
    //         pw.Row(
    //             crossAxisAlignment: pw.CrossAxisAlignment.start,
    //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //             children: [
    //               pw.Column(
    //                   mainAxisAlignment: pw.MainAxisAlignment.start,
    //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
    //                   children: [
    //                     pw.Text('Description',
    //                         style: pw.TextStyle(
    //                             fontSize: 25, fontWeight: pw.FontWeight.bold)),
    //                     pw.SizedBox(height: 70),
    //                     pw.Text('Term and Condition',
    //                         style:  pw.TextStyle(fontSize: 25)),
    //                     pw.Text('1.', style:  pw.TextStyle(fontSize: 25))
    //                   ]),
    //               pw.Column(children: [
    //                 pw.Container(
    //                     alignment: pw.Alignment.center,
    //                     height: 50,
    //                     width: 300,
    //                     decoration:
    //                          pw.BoxDecoration(color: PdfColors.orange),
    //                     child: pw.Text('Total Summary',
    //                         style:  pw.TextStyle(
    //                             fontSize: 25, color: PdfColors.white))),
    //                 pw.Container(
    //                     padding:  pw.EdgeInsets.symmetric(horizontal: 10),
    //                     alignment: pw.Alignment.center,
    //                     height: 220,
    //                     width: 300,
    //                     decoration:
    //                          pw.BoxDecoration(color: PdfColors.grey),
    //                     child: pw.Column(children: [
    //                       pw.SizedBox(height: 30),
    //                       pw.Row(
    //                           mainAxisAlignment:
    //                               pw.MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             pw.Flexible(
    //                                 child: pw.Text('Total (Exc Tax, Disc)',
    //                                     style: pw.TextStyle(fontSize: 20))),
    //                             pw.Text('500 PKR',
    //                                 style: pw.TextStyle(fontSize: 20))
    //                           ]),
    //                       pw.SizedBox(height: 20),
    //                       pw.Row(
    //                           mainAxisAlignment:
    //                               pw.MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             pw.Flexible(
    //                                 child: pw.Text('Discount)',
    //                                     style: pw.TextStyle(fontSize: 20))),
    //                             pw.Text('0 %',
    //                                 style: pw.TextStyle(fontSize: 20))
    //                           ]),
    //                       pw.SizedBox(height: 20),
    //                       pw.Row(
    //                           mainAxisAlignment:
    //                               pw.MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             pw.Flexible(
    //                                 child: pw.Text('Tax)',
    //                                     style: pw.TextStyle(fontSize: 20))),
    //                             pw.Text('10 %',
    //                                 style: pw.TextStyle(fontSize: 20))
    //                           ]),
    //                       pw.SizedBox(height: 20),
    //                       pw.Row(
    //                           mainAxisAlignment:
    //                               pw.MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             pw.Flexible(
    //                                 child: pw.Text('Sub Total(incl tax, Dis) ',
    //                                     style: pw.TextStyle(fontSize: 20))),
    //                             pw.Text('500 PKR)',
    //                                 style: pw.TextStyle(fontSize: 20))
    //                           ])
    //                     ]))
    //               ])
    //             ]),
    //         pw.SizedBox(height: 50),
    //         pw.Footer(
    //             leading: pw.Text('download',
    //                 style:  pw.TextStyle(fontSize: 25)))
    //       ]));
    //       // return pw.Table.fromTextArray(data: data, headers: headers);
    //     }));

    return saveDocuments(name: 'my.pdf', pdf: pdf);
  }

  // static Future<File> generateImage() async {
  //   final pdf = pw.Document();
  // }

  static Future<File> saveDocuments(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
