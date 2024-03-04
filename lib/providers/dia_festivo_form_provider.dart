import 'package:flutter/material.dart';
import 'package:peluqueria/models/models.dart';

class DiaFestivoFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DiaFestivo? diaFestivo;
  DiaFestivoFormProvider(this.diaFestivo);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
