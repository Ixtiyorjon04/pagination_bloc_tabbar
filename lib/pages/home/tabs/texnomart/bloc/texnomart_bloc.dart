import 'package:bloc/bloc.dart';
import 'package:bottom_menu/core/api/pagination_api.dart';
import 'package:bottom_menu/core/models/texnomart_model.dart';
import 'package:meta/meta.dart';

part 'texnomart_event.dart';

part 'texnomart_state.dart';

class TexnomartBloc extends Bloc<TexnomartEvent, TexnomartState> {
  final PaginationApi _api;

  TexnomartBloc(this._api) : super(TexnomartState()) {
    on<TexnomartInitEvent>((event, emit) async {
      emit(state.copyWith(
        status: Status.loading,
        list: [],
        page: 0,
      ));
      try {
        final model = await _api.productsByTexnomart(search: state.search);
        emit(state.copyWith(
          status: Status.success,
          list: model.items,
          page: model.meta.currentPage,
          totalPage: model.meta.pageCount,
        ));
      } catch (e) {}
    });
    on<TexnomartNextEvent>((event, emit) async {
      if (state.page >= state.totalPage) return;

      emit(state.copyWith(status: Status.loading));
      try {
        final model = await _api.productsByTexnomart(
          search: state.search,
          page: state.page + 1,
        );
        emit(state.copyWith(
          status: Status.success,
          list: [...state.list, ...model.items],
          page: model.meta.currentPage,
          totalPage: model.meta.pageCount,
        ));
      } catch (e) {}
    });
    on<TexnomartSearchEvent>((event, emit) async {
      emit(state.copyWith(
        status: Status.loading,
        search: event.text,
        page: 0,
        list: [],
      ));
      try {
        final model = await _api.productsByTexnomart(search: state.search);
        emit(state.copyWith(
          status: Status.success,
          list: model.items,
          page: model.meta.currentPage,
          totalPage: model.meta.pageCount,
        ));
      } catch (e) {}
    });
  }
}
