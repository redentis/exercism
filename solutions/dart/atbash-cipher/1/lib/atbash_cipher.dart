class AtbashCipher {
  List<String> plaintext;
  List<String> ciphertext;
  
  AtbashCipher({String keytext = "abcdefghijklmnopqrstuvwxyz"})
    : 
    this.plaintext = keytext.split(''),
    this.ciphertext = keytext.split('').reversed.toList();
  
  String encode(String message) {
    final _message = message.toLowerCase().split('');
    var _result = [];
    var _c = 0;
    for(var n=0; n < _message.length; n++) {
      final l = _message[n];
      if(l == " " || l == "." || l == ",") continue;
      final i = this.plaintext.indexOf(l);
      if(i == -1) {
        _result.add(l);
      }
      else {
        _result.add(ciphertext[i]);
      }
      _c += 1;
      if(_c % 5 == 0) {
        _result.add(' ');
      }
    }
    return _result.join('').trim();
  }

  String decode(String message) {
    var _result = [];
    for(var n=0; n < message.length; n++) {
      final l = message[n];
      if(l == " ") continue;
      final i = ciphertext.indexOf(l);
      if(i == -1) {
        _result.add(l);
      }
      else {
        _result.add(plaintext[i]);
      }
    } 
    return _result.join('');
  }
}
