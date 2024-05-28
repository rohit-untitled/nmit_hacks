import 'package:flutter/material.dart';
import 'package:skillswap/utils/constants/global.dart';

import '../../../../api_models/sessions_history.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/tags_text_educator_details.dart';
import '../../../../fetch_api/session_history_educator.dart';
import '../../../../utils/constants/image_strings.dart';

class NotificationEducator extends StatelessWidget {
  const NotificationEducator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TSearchContainer(
              text: 'Search',
              padding: EdgeInsets.zero,
              showBorder: true,
              showBackground: false,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<List<SessionHistory>>(
                future: fetchSessionHistory(usernameGlobal, passwordGlobal),
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
                        SessionHistory session = snapshot.data![index];
                        return GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            barrierDismissible: false,
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
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TagTextsEducatorDetails(
                                        tags: session.tagNames,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text('Price: ${session.price}'),
                                    ],
                                  ),
                                ),
                                Text(
                                  session.sessionStatus,
                                  style: const TextStyle(
                                    color: Colors.green,
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

class AlertDialogNotification extends StatelessWidget {
  final SessionHistory session;

  const AlertDialogNotification({Key? key, required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Session Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ID: ${session.id}'),
          Text('Duration: ${session.duration}'),
          Text('Price: ${session.price}'),
          Text('Description: ${session.problemDescription}'),
          Text('Status: ${session.sessionStatus}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
