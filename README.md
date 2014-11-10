Data-Encryption-Standard-DES
=============================
[`DES`](http://en.wikipedia.org/wiki/Data_Encryption_Standard) is an encryption algorithm developed in early 1970s. It is mainly used for protecting sensitive electronic data. DES ciphers a given `Message` into an `Encrypted Value` (ciphered message) by using a given `Key`.
 I implemented the DES algorithm in *assembly*. For this purpose, I first implemented DES in *C++* and then translated the *C++* code into *assembly*.

# How to use it

In order to run the C++ code, put the byte arrays of the `Message` and `Key` in the `msga` and `keya` variables, respectively. You will get the ciphered message in the form of a `long long integer` (64 bits). 

In order to run the assembly code, put the ASCII code of the `Key` and `Message` in the `map_key` and `map_msg` variables, respectively. You will get the ciphered message in the form of hexadecimal (`Cipher Output HEX:= `). 


