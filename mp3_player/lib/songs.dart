import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  List<FileSystemEntity> files = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    if (await Permission.storage.request().isGranted) {
      final directory = Directory('/storage/emulated/0/Download');
      if (directory.existsSync()) {
        final fileEntities = directory.listSync();
        setState(() {
          files = fileEntities;
        });
      } else {
        print("Directorio no encontrado");
      }
    } else {
      print("Permisos de almacenamiento denegados.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archivos en Descargas'),
      ),
      body: files.isNotEmpty
          ? ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                final isFile = file is File;

                return ListTile(
                  leading: Icon(isFile ? Icons.insert_drive_file : Icons.folder),
                  title: Text(file.path.split('/').last),
                  subtitle: Text(isFile ? 'Archivo' : 'Carpeta'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Seleccionaste: ${file.path}')),
                    );
                  },
                );
              },
            )
          : const Center(
              child: Text('No se encontraron archivos.'),
            ),
    );
  }
}
