import 'package:flutter/material.dart';
import 'package:skillswap/api_models/sessions_list.dart';
import 'package:skillswap/utils/constants/global.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
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
            FutureBuilder<List<Session>>(
              future: fetchLearnerSessions(usernameGlobal, passwordGlobal),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No sessions found'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Session session = snapshot.data![index];
                        return ListTile(
                          title: Text(
                              'Session ${session.id} - ${session.duration} mins'),
                          subtitle: Text(session.problemDescription),
                          trailing: Text('\$${session.price}'),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
