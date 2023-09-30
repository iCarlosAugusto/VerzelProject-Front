import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:verzel_project/main.dart';
import 'package:verzel_project/models/offer_model.dart';
import 'package:verzel_project/repositories/offer_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final OfferRepository _offerRepository = getIt<OfferRepository>();

  final ObservableList<OfferModel> _offers = ObservableList<OfferModel>();
   ObservableList<OfferModel> get offers => _offers; 

  @observable
  bool isLoading = false;
  

  _HomeControllerBase() {
    _fetchOffers();
    _scrollController.addListener(_infiniteScrolling);
  }

  @action
  _fetchOffers() async {
    isLoading = true;
    dynamic result = await _offerRepository.getAll();
    List<OfferModel> offersResult = List.from(result.map((e) => OfferModel.fromJson(e)));
    _offers.addAll(offersResult);
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }

  _infiniteScrolling() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading) {
      _fetchOffers();
    }
  }
}