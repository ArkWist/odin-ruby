# Caesar Cipher

A cipher that encrypts text by substituting letters alphabetically.

#### Example

text = `ruby`
shift = `2`

Each letter in `ruby` is shifted `2` letters alphabetically.



`r` s `t`
`u` v `w`
`b` c `d`
`y` z `a`


`text` | `shift = 1` | `shift = 2` | `shift = 3` | `shift = 4`

First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column



For example, given the text `ruby` and a shift of `2`, each letter in `ruby` is shifted two letters alphabetically. `r` > `t` 

Takes a string and an offset, and returns the string with all the letters offset by the specified number of letters. I wrote this to practice Ruby as part of [The Odin Project](http://www.theodinproject.com/) curriculum. 

See **[Projects: Ruby Building Blocks](http://www.theodinproject.com/ruby-programming/building-blocks)** for more information.

### What I learned

I learned about .ord and .chr. I was also happy to come up with a straightforward solution for dealing with large offsets (offsets greater than the range of letters---in this case 26 for the alphabet).
