class Hall
{
  List<String>? halls;
  Hall({this.halls});

  factory Hall.fromJson(List<dynamic> json)
  {
    return Hall(
      halls: json.cast<String>()
    );
  }

}