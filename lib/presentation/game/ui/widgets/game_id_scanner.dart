import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:trivia_app/presentation/home/cubit/home_cubit.dart';

class GameIdScanner extends StatelessWidget {
  const GameIdScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 400,
        child: MobileScanner(
          onDetect: (barcode, args) {
            if (barcode.rawValue != null) {
              context.read<HomeCubit>().joinGame(barcode.rawValue!);
            }
          },
          allowDuplicates: false,
          controller: MobileScannerController(),
        ),
      ),
    );
  }
}
