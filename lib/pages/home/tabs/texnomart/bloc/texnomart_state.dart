part of 'texnomart_bloc.dart';

@immutable
class TexnomartState {
  final Status status;
  final String message;
  final String search;
  final List<TexnomartItem> list;
  final int page;
  final int totalPage;

  TexnomartState({
    this.status = Status.initial,
    this.message = "",
    this.search = "",
    this.list = const [],
    this.page = 0,
    this.totalPage = 0,
  });

  TexnomartState copyWith({
    Status? status,
    String? message,
    String? search,
    List<TexnomartItem>? list,
    int? page,
    int? totalPage,
  }) {
    return TexnomartState(
      status: status ?? this.status,
      message: message ?? this.message,
      search: search ?? this.search,
      list: list ?? this.list,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}

enum Status { initial, loading, success, fail }
