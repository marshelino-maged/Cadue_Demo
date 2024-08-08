import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/presentation/screens/occasions/occasions_view_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/widgets/occasion/occasion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OccasionsScreen extends ConsumerStatefulWidget {
  const OccasionsScreen({super.key});

  @override
  ConsumerState<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends ConsumerState<OccasionsScreen> {
  final _viewModel = OccasionsViewModel();
  @override
  void initState() {
    super.initState();
    _viewModel.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGetter.white255,
      appBar: AppBar(
        backgroundColor: ColorsGetter.white255,
        title: StyledText(
          SentencesGetter.occasionsTitle,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImagesGetter.notificationIcon),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer(
          builder: (context, ref, child) {
            final occasions = ref.watch(_viewModel.occasions);
            final hasNext = ref.watch(_viewModel.hasNext);
            return ListView.builder(
              controller: _viewModel.controller,
              itemCount: occasions.length + 1,
              itemBuilder: (context, index) {
                if (index == occasions.length) {
                  return hasNext
                      ? const Center(
                          child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ))
                      : null;
                }
                return OccasionItem(
                    occasion: occasions[index],
                    onOccasionClicked: () {
                      _viewModel.showProducts(context,
                          occasionTitle: occasions[index].name!,
                          occasionId: occasions[index].id!);
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
