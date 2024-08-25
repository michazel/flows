part of 'click_log_bloc.dart';

@immutable
sealed class ClickLogState {
  final int height;
  final String activeId;

  const ClickLogState({
    required this.height,
    required this.activeId
  });
}
final class InputInitial extends ClickLogState {
  const InputInitial({
    required super.height,
    required super.activeId
  }) : super();
}