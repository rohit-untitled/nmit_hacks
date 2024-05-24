import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../api_models/educator_list.dart';
import '../../../../fetch_api/educators.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../products_cards/educator_card_vertical.dart';

class TSortableProducts extends StatefulWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  State<TSortableProducts> createState() => _TSortableProductsState();
}

class _TSortableProductsState extends State<TSortableProducts> {
  late Future<List<Educator>> futureEducators;

  @override
  void initState() {
    super.initState();

    futureEducators = fetchEducators();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Ratings',
            'Number of sessions',
            'Newest educators',
            'Popularity',
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // popular educators
        // TGridLayout(
        //     itemCount: 4,
        //     itemBuilder: (_, index) => const TProductCartVertical())
        FutureBuilder<List<Educator>>(
          future: futureEducators,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No educators found'));
            } else {
              return TGridLayout(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) =>
                    EducatorCardVertical(educator: snapshot.data![index]),
              );
            }
          },
        ),
      ],
    );
  }
}
