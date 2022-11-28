abstract class NewsStates{}

class InitialNews extends NewsStates{}

class NewsBottomStates extends NewsStates{}

class NewsBusinessLoading extends NewsStates{}

class NewsBusinessSuccess extends NewsStates{}

class NewsBusinessError extends NewsStates{
  final String error;
  NewsBusinessError(this.error);

}

class NewsScienceLoading extends NewsStates{}

class NewsScienceSuccess extends NewsStates{}

class NewsScienceError extends NewsStates{
  final String error;
  NewsScienceError(this.error);

}

class NewsSportLoading extends NewsStates{}

class NewsSportSuccess extends NewsStates{}

class NewsSportsError extends NewsStates{
  final String error;
  NewsSportsError(this.error);

}

class NewsSearchLoading extends NewsStates{}

class NewsSearchSuccess extends NewsStates{}

class NewsSearchError extends NewsStates{
  final String error;
  NewsSearchError(this.error);

}
class ChangeTheme extends NewsStates{}