import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<Product> products = [];

  Future<void> search(String name) async {
    emit(SearchLoading());
    var data = await SearchRepo.search(name);
    if (data != null) {
      products = data.data?.products ?? [];
      emit(SearchSuccess());
    } else {
      emit(SearchError());
    }
  }
}
