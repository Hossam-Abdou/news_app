part of 'system_cubit.dart';

@immutable
abstract class SystemState {}

class SystemInitial extends SystemState {}


class CurrentIndex extends SystemState {}

class DoctorGetAllPatientSuccess extends SystemState {}
class DoctorGetAllPatientError extends SystemState {}
class DoctorGetAllPatientLoading extends SystemState {}

class GetScienceSuccess  extends SystemState {}
class GetScienceError extends SystemState {}
class GetScienceLoading  extends SystemState {}


class GetBusinessSuccess  extends SystemState {}
class GetBusinessError extends SystemState {}
class GetBusinessLoading  extends SystemState {}

class GetSportSuccess  extends SystemState {}
class GetSportError extends SystemState {}
class GetSportLoading  extends SystemState {}

class ModeSuccess extends SystemState{}

