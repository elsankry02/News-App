import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_error_massage.dart';
import '../../../data/bloc/featch_search_tabs/featch_search_tabs_cubit.dart';
import '../../card_page/card_page.dart';
import '../shimmer/shimmer_card_details.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchTebsCubit, FetchSearchTebsState>(
      builder: (context, state) {
        if (state is FetchSearchTebsSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CardPage(
                    article: state.news[index],
                  ),
                );
              },
            ),
          );
        } else if (state is FetchSearchTebsFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassage);
        } else {
          return const Expanded(
            child: CardDetailsShimmer(),
          );
        }
      },
    );
  }
}
