import 'package:flutter/material.dart';
import 'package:peluqueria/providers/dia_festivo_form_provider.dart';
import 'package:peluqueria/services/services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DiaFestivoScreen extends StatefulWidget {
  const DiaFestivoScreen({super.key});

  @override
  State<DiaFestivoScreen> createState() => _DiaFestivoScreenState();
}

class _DiaFestivoScreenState extends State<DiaFestivoScreen> {
  @override
  Widget build(BuildContext context) {
    final diaFestivoService = Provider.of<DiasFestivosServices>(context);

    return ChangeNotifierProvider(
      create: (context) =>
          DiaFestivoFormProvider(diaFestivoService.diaFestivoSeleccionado),
      child: _DiaFestivoScreenBody(
        diaFestivoService: diaFestivoService,
      ),
    );
  }
}

class _DiaFestivoScreenBody extends StatelessWidget {
  const _DiaFestivoScreenBody({Key? key, required this.diaFestivoService})
      : super(key: key);
  final DiasFestivosServices diaFestivoService;

  @override
  Widget build(BuildContext context) {
    final diaFestivoForm = Provider.of<DiaFestivoFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dia Festivo'),
      ),
      body: const _DiaFestivoForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!diaFestivoForm.isValidForm()) return;
          diaFestivoService.saveOrCreate(diaFestivoForm.diaFestivo!);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Registro guardado'),
                content: const Text(
                    'Se han guardado los datos del registro exitosamente.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(color: AppTheme.primary),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _DiaFestivoForm extends StatelessWidget {
  const _DiaFestivoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diaFestivoForm = Provider.of<DiaFestivoFormProvider>(context);
    final diaFestivo = diaFestivoForm.diaFestivo;

    String date =
        '${diaFestivo!.day.toString().padLeft(2, '0')}/${diaFestivo.month.toString().padLeft(2, '0')}';

    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = date;

    Future<void> selectDate() async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        diaFestivo.month = pickedDate.month;
        diaFestivo.day = pickedDate.day;
        date =
            '${diaFestivo.day.toString().padLeft(2, '0')}/${diaFestivo.month.toString().padLeft(2, '0')}';
        textEditingController.text = date;
      }
    }

    return Form(
      key: diaFestivoForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController,
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Debe seleccionar una fecha';
                }
                return null;
              },
              onTap: () {
                selectDate();
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  fillColor: AppTheme.primary,
                  filled: true,
                  focusColor: Colors.blue,
                  hintText: 'Fecha de la festividad',
                  hintStyle: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 129, 129, 129))),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextFormField(
              initialValue: diaFestivo.festiveName,
              validator: (value) {
                if (value!.isEmpty || value.length < 2) {
                  return "El nombre debe tener al menos 3 carácteres";
                }
                return null;
              },
              onChanged: (value) {
                diaFestivo.festiveName = value;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.work_off,
                    color: Colors.white,
                  ),
                  fillColor: AppTheme.primary,
                  filled: true,
                  focusColor: Colors.blue,
                  hintText: 'Nombre de la festividad',
                  hintStyle: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 129, 129, 129))),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
