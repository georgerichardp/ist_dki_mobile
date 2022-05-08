///extensions ini untuk memanipulasi variable yang memiliki type data string
///semua function dimulai dengan i (contoh iClear) kenapa harus gini karna
///takutnya di class String atau package lain ada function yang sama
///dan untuk pemanggilan lebih mudah juga
extension IStringExtension on String{
  String iClear(){
     return "";
  }
}