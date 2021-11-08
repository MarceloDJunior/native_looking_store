import 'package:native_looking_store/components/icons/clock_icon.dart';
import 'package:native_looking_store/components/platform_widgets/platform_text_field.dart';
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import 'package:native_looking_store/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double _kDateTimePickerHeight = 216;

class PlatformDateTimePicker extends PlatformWidget<Column, GestureDetector> {
  final DateTime dateTime;
  final String label;
  final void Function(DateTime) onDateTimeChanged;

  const PlatformDateTimePicker({
    Key? key,
    required this.dateTime,
    required this.onDateTimeChanged,
    required this.label,
  }) : super(key: key);

  @override
  GestureDetector createAndroidWidget(BuildContext context) {
    void _showTimePicker(DateTime pickedDate) {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedDate),
      ).then((pickedTime) {
        if (pickedTime != null) {
          onDateTimeChanged(DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          ));
        }
      });
    }

    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: dateTime.subtract(const Duration(days: 365 * 2)),
        lastDate: dateTime.add(const Duration(days: 365 * 2)),
      ).then((pickedDate) {
        if (pickedDate != null) {
          _showTimePicker(pickedDate);
        }
      });
    }

    return GestureDetector(
      onTap: _showDatePicker,
      child: PlatformTextField(
        controller:
            TextEditingController(text: DateFormat.yMMMMd().add_jm().format(dateTime)),
        prefix: ClockIcon(
          color: Styles.inputIconColor,
          size: 28,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        autocorrect: false,
        label: label,
        enabled: false,
      ),
    );
  }

  @override
  Column createIosWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClockIcon(
                  color: Styles.inputIconColor,
                  size: 28,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: Styles.deliveryTimeLabel,
                ),
              ],
            ),
            Text(
              DateFormat.yMMMd().add_jm().format(dateTime),
              style: Styles.deliveryTime,
            ),
          ],
        ),
        SizedBox(
          height: _kDateTimePickerHeight,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: dateTime,
            onDateTimeChanged: onDateTimeChanged,
          ),
        ),
      ],
    );
  }
}
