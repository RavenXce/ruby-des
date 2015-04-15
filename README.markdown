RubyDES
=======

RubyDES is a full Ruby implementation of the Data Encryption Standard.  The purpose of this 
project was to allow Ruby programmers interested in cryptography a glimpse of how a robust 
cryptographic algorithm functions in a language they understand.

The best way to understand the RubyDES source code is by following along with a FIPS 46, 
which you can find at http://csrc.nist.gov/publications/fips/fips46-3/fips46-3.pdf

NOTE: DES is deprecated, and as such, you should not use this implementation in any project you 
are developing.  I highly recommend the AES, TwoFish or Serpent algorithms through the OpenSSL 
library instead.

Running RubyDES
===============

Using RubyDES is pretty easy.  First, construct a new data and key block.

    data = RubyDES::Block.new('mysecret')
    key  = RubyDES::Block.new('hushhush')

Then, build a new `RubyDES::Ctx` object and supply the data and key block.

    des = RubyDES::Ctx.new(data, key)

Finally, let it go.

    encrypted_data = des.encrypt

You will then be returned a DES encrypted block that is completely secure against eavesdropping 
(if it were still 1997).

To decrypt an encrypted data block, just build a new `RubyDES::Ctx` object in similar 
fashion as before.

    un_des = RubyDES::Ctx.new(encrypted_data, key)

And run the DES with the key schedule reversed.

    decrypted_data = un_des.decrypt

You can then check to see if it all worked.

    data.bit_array.eql?(decrypted_data.bit_array)

Enjoy!


More Info
=========

This fork fixes some minor issues with String inputs and adds Bignum support (hex, integer, etc) for constructing a `RubyDES::Block`.

It also prints out a trace after the initial permutation, at each iteration of key schedule calculation, and at each iteration of encryption.

Finally, a sample runnable script is provided in `main.rb`.

If you have any questions or comments about the original library, or just want to talk shop about crypto, please contact the original author at http://www.robertsosinski.com.
