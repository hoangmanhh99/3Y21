import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/app_constants.dart';
import 'package:intl/intl.dart';

//Validate bang AppConstants.validateTime hoac AppConstants.validateDate tai view
class DateFormfield extends FormField<String> {
  DateFormfield({
    Key? key,
    required TextEditingController controller,
    String? initialValue,
    String? txtInPut,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool chooseTime = false,
    required ValueChanged<String> callbackDateTimeShow,
    double? width,
    double? iconSize,
    double fontSize = 14,
    bool filled = false,
    bool future = false,
    bool myAutoValidate = false,
    required ValueChanged<DateTime> callbackDateTimeValue,
    bool checkStyle = false
  }) : super(
      key: key,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      autovalidate: autoValidate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState state) {
        DateFormat formatter = DateFormat("dd/MM/yyyy");
        DateFormat formatterTime = DateFormat("dd/MM/yyyy HH:mm");
        return TextField(
          style: Theme.of(state.context).textTheme.bodyText1,
          controller: controller,
          onChanged: (text) {
            state.didChange(text);
            if (callbackDateTimeValue!=null){
                if (chooseTime){
                  if (AppConstants.validateTime(state.value)) {
                    callbackDateTimeValue(formatterTime.parse(state.value).toLocal());
                  }
                } else {
                  if (AppConstants.validateDate(state.value)) {
                    callbackDateTimeValue(formatter.parse(state.value).toLocal());
                  }
                }
            }
          },
          decoration: InputDecoration(
            hintText: chooseTime?'Ngày/Tháng/Năm Giờ:Phút':'Ngày/Tháng/Năm',
            errorText: state.errorText,
            suffixIcon: InkWell(
                onTap: ()async {
                  if (enabled==true){
                    DateTime date;
                    TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
                    date = (await showDatePicker(
                      fieldHintText: 'Ngày/Tháng/Năm',
                      context: state.context,
                      locale: const Locale("vi", "VN"),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 100),
                      lastDate: future?DateTime(DateTime.now().year + 14):DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light().copyWith(
                              primary: Colors.red,
                            ), //Background color
                          ),
                          child: child!,
                        );
                      }
                    ))!;
                    if (chooseTime) {
                      if (date != null) {
                        time = (await showTimePicker(
                          context: state.context,
                          initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light().copyWith(
                                  primary: Colors.red,
                                ), //Background color
                              ),
                              child: child!,
                            );
                          }
                        ))!;
                        if (time != null) {
                          state.didChange(
                              formatterTime.format(DateTime(
                                date.year,
                                date.month,
                                date.day,
                                time.hour,
                                time.minute,
                              ).toLocal()).toString());
                          callbackDateTimeShow(state.value);
                          callbackDateTimeValue(formatterTime.parse(state.value));
                        }
                      }
                    } else {
                      if (date != null) {
                        state.didChange(
                          formatter.format(DateTime(
                            date.year,
                            date.month,
                            date.day,
                          ).toLocal()).toString());
                        callbackDateTimeShow(state.value);
                        callbackDateTimeValue(formatter.parse(state.value));
                      }
                    }
                  }
                },
                child: Icon(Icons.date_range, color: Colors.black,)),
          ),
        );
      });
}
