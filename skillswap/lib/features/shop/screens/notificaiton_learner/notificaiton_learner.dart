import 'package:flutter/material.dart';
import 'package:skillswap/api_models/sessions_list.dart';
import 'package:skillswap/common/widgets/images/t_circular_image.dart';
import 'package:skillswap/common/widgets/texts/price_text.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';
import 'package:skillswap/features/shop/screens/notificaiton_learner/widgets/alert_dialog_notification.dart';
import 'package:skillswap/utils/constants/colors.dart';
import 'package:skillswap/utils/constants/global.dart';
import 'package:skillswap/utils/constants/image_strings.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/tags_text_educator_details.dart';
import '../../../../fetch_api/learner_sessions.dart';
import '../../../../utils/constants/sizes.dart';

class NotificationLearner extends StatelessWidget {
  const NotificationLearner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TSearchContainer(
              text: 'Search',
              padding: EdgeInsets.zero,
              showBorder: true,
              showBackground: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Expanded(
              child: FutureBuilder<List<Session>>(
                future: fetchLearnerSessions(usernameGlobal, passwordGlobal),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No sessions found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Session session = snapshot.data![index];
                        return GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            barrierDismissible:
                                false, 
                            builder: (BuildContext context) {
                              return AlertDialogNotification(session: session);
                            },
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const TCircularImage(
                                  image: TImages.user,
                                  width: 60,
                                  height: 60,
                                  padding: 0,
                                ),
                                const SizedBox(width: TSizes.spaceBtwSections),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleText(
                                        title: session.educator,
                                        largeSize: true,
                                      ),
                                      TagTextsEducatorDetails(
                                        tags: session.tags,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      const SizedBox(height: TSizes.sm),
                                      PriceText(price: session.price),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  session.sessionStatus,
                                  style: const TextStyle(
                                    color: TColors.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
