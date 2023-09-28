import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @observable
  bool isLoading = false;
  

  _HomeControllerBase() {
    _scrollController.addListener(_infiniteScrolling);
  }

  @action
  _fetchOffers() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 5));
    isLoading = false;

  }

  _infiniteScrolling() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading) {
      _fetchOffers();
    }
  }
}