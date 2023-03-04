import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bottom_menu/core/models/karzinka_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/pagination_api.dart';

part 'karzinka_event.dart';

part 'karzinka_state.dart';

class KarzinkaBloc extends Bloc<KarzinkaEvent, KarzinkaState> {
  final PaginationApi _api;

  KarzinkaBloc(this._api) : super(KarzinkaState()) {
    on<KarzinkaInitEvent>((event, emit) async {
      emit(state.copyWith(
        status: Status.loading,
        page: 0,
        hasData: true,
      ));
      final data = await _api.news(offset: state.page, limit: state.totalPage);
      try {
        emit(state.copyWith(
            status: Status.success,
            list: data
        ));
      } catch (e) {}
    });
    on<KarzinkaSeatchEvent>((event, emit) async {
      emit(state.copyWith(
          status: Status.loading,
          search: event.text,
          page: 0,
          hasData: true,
          list: []
      ));
      // final data = await _api.news(offset: state.page,limit: state.totalPage);
      try {
        emit(state.copyWith(
          status: Status.success,
          list: await _api.news(
              search: event.text, offset: state.page, limit: state.totalPage),
        ));
      } catch (e) {}
    });
    on<KarzinkaNextEvent>((event, emit) async {
      if (!state.enabled) return;

      emit(state.copyWith(
        status: Status.loading,
        page: state.page + state.totalPage,
      ));
      try {
        final products = await _api.news(
          search: event.text,
          offset: state.page,
          limit: state.totalPage,
        );
        emit(
          state.copyWith(
            status: Status.success,
            hasData: products.isNotEmpty,
            list: [...state.list, ...products],
          ),
        );
      } catch (e) {}
    });
  }
}

// class TexnomartBloc extends Bloc<TexnomartEvent, TexnomartState> {
//   final PaginationApi _api;
//
//   TexnomartBloc(this._api) : super(TexnomartState()) {
//     on<TexnomartInitEvent>((event, emit) async {
//       emit(state.copyWith(
//         status: Status.loading,
//         list: [],
//         page: 0,
//       ));
//       try {
//         final model = await _api.productsByTexnomart(search: state.search);
//         emit(state.copyWith(
//           status: Status.success,
//           list: model.items,
//           page: model.meta.currentPage,
//           totalPage: model.meta.pageCount,
//         ));
//       } catch (e) {}
//     });
//     on<TexnomartNextEvent>((event, emit) async {
//       if (state.page >= state.totalPage) return;
//
//       emit(state.copyWith(status: Status.loading));
//       try {
//         final model = await _api.productsByTexnomart(
//           search: state.search,
//           page: state.page + 1,
//         );
//         emit(state.copyWith(
//           status: Status.success,
//           list: [...state.list, ...model.items],
//           page: model.meta.currentPage,
//           totalPage: model.meta.pageCount,
//         ));
//       } catch (e) {}
//     });
//     on<TexnomartSearchEvent>((event, emit) async {
//       emit(state.copyWith(
//         status: Status.loading,
//         search: event.text,
//         page: 0,
//         list: [],
//       ));
//       try {
//         final model = await _api.productsByTexnomart(search: state.search);
//         emit(state.copyWith(
//           status: Status.success,
//           list: model.items,
//           page: model.meta.currentPage,
//           totalPage: model.meta.pageCount,
//         ));
//       } catch (e) {}
//     });
//   }
// }
