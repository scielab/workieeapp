
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';

// se pide informacion adicional en esta pagina

class RevisionProviderScreen extends StatelessWidget {
  const RevisionProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BigText(title: "Esta es la informacion"),
      ),
    );
  }
}