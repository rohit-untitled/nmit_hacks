import 'package:flutter/material.dart';
import 'package:skillswap/api_models/educator_list.dart';
import 'package:skillswap/common/widgets/custom_buttons/custom_button.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';
import 'package:skillswap/features/shop/screens/time_slots/widgets/timings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/query_textfield.dart';

class TimeSlots extends StatefulWidget {
  final Educator educator;
  const TimeSlots({super.key, required this.educator});

  @override
  State<TimeSlots> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  int? _selectedIndex;
  final TextEditingController _queryController = TextEditingController();

  void _handleTimingTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: TAppBar(
        title: Text(
          'Time Slots',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                  title:
                      'Book your sessions with the educator from the below time slots'),
              const SizedBox(height: TSizes.spaceBtwItems),

              //time slots
              for (int i = 0; i < 3; i++)
                Timings(
                  selected: _selectedIndex == i,
                  educator: widget.educator,
                  onTap: () => _handleTimingTap(i),
                ),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TitleText(title: 'Describe your query below'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // query text field

              QueryTextfiled(queryController: _queryController),

              const SizedBox(height: TSizes.spaceBtwSections),
              CustomButton(onPressed: () {}, text: 'Request your educator')
            ],
          ),
        ),
      ),
    );
  }
}
