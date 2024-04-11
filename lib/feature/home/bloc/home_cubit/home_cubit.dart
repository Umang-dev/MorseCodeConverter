import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morse_code_converter/utils/consts.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void resetState() {
    emit(HomeInitial());
  }

  void convert(String inputText) {
    if (inputText.isNotEmpty) {
      if (!isValidString(inputText)) {
        convertToEnglish(inputText);
      } else {
        convertToMorse(inputText);
      }
    } else {
      emit(HomeErrorState(errorString: 'Please Enter some value'));
    }
  }

  void convertToEnglish(String morseCode) {
    List<String> words = morseCode.split(RegExp('\\s{3}'));
    String englishText = '';
    String tempText = '';

    for (String word in words) {
      List<String> letters = word.split(' ');
      for (String letter in letters) {
        tempText += Consts.morseToEnglishMap[letter] ?? '';
      }
      tempText = tempText[0].toUpperCase() + tempText.substring(1);
      englishText += '$tempText ';
      tempText = '';
    }
    emit(HomeConvertState(convertedString: englishText.trim()));
  }

  void convertToMorse(String englishText) {
    List<String> words = englishText.toLowerCase().split('');
    String morseCode = '';

    for (String word in words) {
      morseCode +=
          '${Consts.morseToEnglishMap.keys.firstWhere((key) => Consts.morseToEnglishMap[key] == word, orElse: () => '')} ';
      // morseCode += '${getKey(word)} ';
      // morseCode += '${Consts.englishToMorseMap[word]} ';
    }
    emit(HomeConvertState(convertedString: morseCode.trim()));
  }

  bool isValidString(String text) {
    RegExp morsePattern = RegExp(r'^[a-zA-Z0-9\s]*$');
    return morsePattern.hasMatch(text);
  }

  String getKey(String inputValue) {
    String temp = '';
    Consts.morseToEnglishMap.forEach((key, value) {
      if (value == inputValue) {
        temp = key;
      }
    });
    return temp;
  }
}
