```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body);
      print(data);
    } else {
      //Instead of throwing a generic exception, provide more context
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    //Handle JSON decoding errors specifically
    print('JSON decoding error: $e'); 
  } catch (e) {
    // Handle other exceptions
    print('Error: $e');
    // Don't rethrow here if you've handled it sufficiently at this level
  }
}
```