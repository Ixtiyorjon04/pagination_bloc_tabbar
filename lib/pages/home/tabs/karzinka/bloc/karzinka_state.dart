part of 'karzinka_bloc.dart';

@immutable
class KarzinkaState {
  final Status status;
  final String message;
  final String search;
  final List<LeBazarData> list;
  final bool enabled;
  final int page;
  final int totalPage;

  KarzinkaState(
      {this.status = Status.initial,
      this.message = "",
      this.search = "",
      this.list = const [],
      this.enabled = true,
      this.page = 0,
      this.totalPage = 0});

  KarzinkaState copyWith({
    Status? status,
    String? message,
    String? search,
    List<LeBazarData>? list,
    bool? hasData,
    int? page,
    int? totalPage,
  }) {
    return KarzinkaState(
      status: status ?? this.status,
      message: message ?? this.message,
      search: search ?? this.search,
      list: list ?? this.list,
      enabled: hasData ?? this.enabled,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}

enum Status { initial, loading, success, fail }
