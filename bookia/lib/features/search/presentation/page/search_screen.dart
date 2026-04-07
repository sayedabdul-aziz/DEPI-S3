import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/shimmer/shimmer_grid_view.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search For books')),
      body: MyBodyView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  var books = context.read<SearchCubit>().products;
                  if (state is! SearchSuccess) {
                    return ShimmerGridView(
                      itemCount: 6,
                      itemHeight: 250,
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  }
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: books.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 250,
                    ),
                    itemBuilder: (context, index) =>
                        BookCard(book: books[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
