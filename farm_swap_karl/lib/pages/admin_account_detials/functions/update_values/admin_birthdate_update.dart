import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_date_fieldds.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../controllers/update_controller.dart';
import '../../others/admin_update_labels.dart';

class AdminBirthDateUpdate extends StatefulWidget {
  AdminBirthDateUpdate(
      {super.key, required this.optionValue, required this.userid});

  String userid;
  String? optionValue;

  @override
  State<AdminBirthDateUpdate> createState() => _AdminBirthDateUpdateState();
}

class _AdminBirthDateUpdateState extends State<AdminBirthDateUpdate> {
//Class Objects
  AdminUpdateLabels myLabel = AdminUpdateLabels();
  AdminUpdateControllers myControllers = AdminUpdateControllers();
  UpdateAdminDateFields dateFields = UpdateAdminDateFields();

  String updatedValue = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text("Birth Date"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Enter Birthdate"),
              /*So para dili kalas og page, sa pop up na dialog box nalang ta mag enter sa 
                        details nga para update */
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: GestureDetector(
                        onTap: () {
                          _selectDate(widget.userid);
                        },
                        child: const Text("Select Date"),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    /*Ny atong gitawag diri sa onpressed ang method na updateString field, naa ni diras ubos
                                nya mo dawat og duha ka value, ang new data nga ato e update, og ang userid */
                    dateFields.adminDateFields(
                        widget.optionValue, registerdate, widget.userid);
                    Navigator.of(context)
                        .pushNamed(RoutesManager.displayadmindetails);
                  },
                  child: const Text("Update"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  DateTime registerdate = DateTime.now();
  DateTime birthdate = DateTime.now();
  Future<void> _selectDate(String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: registerdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != registerdate) {
      setState(() {
        registerdate = pickedDate;
      });
    }
  }
}
