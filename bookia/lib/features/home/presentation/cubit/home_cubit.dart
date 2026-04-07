import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/data/models/sliders_response/slider.dart';
import 'package:bookia/features/home/data/models/sliders_response/sliders_response.dart';
import 'package:bookia/features/home/data/repository/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> bestSellers = [];

  Future<void> getInitData() async {
    emit(HomeLoadingState());
    // sliders & best sellers
    var results = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSellers(),
    ]);
    var slidersRes = results[0] as SlidersResponse?;
    var bestSellersRes = results[1] as BestSellerResponse?;

    if (slidersRes != null || bestSellersRes != null) {
      sliders = slidersRes?.data?.sliders ?? [];
      bestSellers = bestSellersRes?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}

// sliders => 300 ms
// best sellers => 700 ms

// total (serial) => 1000 ms
// total (parallel) => 700 ms  => UX

// separate functions
// slider loading () , best sellers loading ()
// slider success ()
// best sellers success ()

// buildWhen
