///extensions ini untuk memanipulasi variable yang memiliki type data double
///semua function dimulai dengan i (contoh iClear) kenapa harus gini karna
///takutnya di class String atau package lain ada function yang sama
///dan untuk pemanggilan lebih mudah juga
extension IDoubleExtensions on double{

  //ini hanya contoh
  double kali2(){
    return this*2;
  }
  String iToRp(){
    return "Rp. $this";
  }
  static double padding = 2;
}

