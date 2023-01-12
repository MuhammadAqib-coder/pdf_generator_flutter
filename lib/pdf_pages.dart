import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf_task/pdf_api.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPages extends StatefulWidget {
  const PdfPages({super.key});

  @override
  State<PdfPages> createState() => _PdfPagesState();
}

class _PdfPagesState extends State<PdfPages> {
  final pdf = pw.Document();
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PDF  Task'),
      ),
      body: Container(
        // padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: file != null
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: PDFView(
                          fitPolicy: FitPolicy.BOTH,
                          enableSwipe: false,
                          filePath: file!.path,
                          onError: (error) {
                            print(error);
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          'No File selected',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromWidth(250)),
                      shape: MaterialStateProperty.all<StadiumBorder>(
                          const StadiumBorder())),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      file = result.files.first;
                      var ext = file!.extension;
                      if (ext == 'pdf') {
                        setState(() {});
                      } else {
                        var snackBar = const SnackBar(
                            content: Text('Please Select only Pdf file'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: const Text('pick File')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromWidth(250)),
                      shape: MaterialStateProperty.all<StadiumBorder>(
                          const StadiumBorder())),
                  onPressed: () async {
                    final pdfFile = await PdfApi.generateTable();
                    PdfApi.openFile(pdfFile);
                  },
                  child: const Text('generate pdf')),
            ],
          ),
        ),
      ),
    );
  }
}
