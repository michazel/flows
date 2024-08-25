part of 'click_log_bloc.dart';

@immutable
sealed class ClickLogEvent {
  final String id;

  const ClickLogEvent({required this.id});
}

class Click extends ClickLogEvent {
  const Click({required super.id}) : super();
}