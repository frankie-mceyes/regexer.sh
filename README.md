# regexery.sh
A script made to simplify the creation of a regex query.

# Quick explanation
The tool takes a string as input via command line parameter, it expects only one parameter for the time.
Taken the string, makes it a regex query.

## What does it do?
* Every character will become a choice between uppercase and lowercase, in square parenthesis (as regex syntax says).
* Every number or symbol will not be repeated and it will just show as a character to be matched.
* Every space will become a dot, that means "every character" in regex syntax.
* Every double backslash `\\` will become, as regex syntax would do, a character to be matched, so it will be a backslash in square parenthesis.
* Every character that has a backslash before, for example `\s` for spaces or `\w` for every word character, will be treated as an escape character, so it will just transcripted as is.

## Warning
* In order to have a 100% chance of good conversion, you have to write the string between **single quotes**, and **not** double quotes.
That will avoid the interpolation of characters like backslashes, dollar symbols etc...
* Due to BASH limitations, you cannot escape single quotes, but only double quotes. Examples below.

# Examples
```
$ ./regexery.sh 'testing'
/[Tt][Ee][Ss][Tt][Ii][Nn][Gg]/

$ ./regexery.sh 'email@mail.ru'
/[Ee][Mm][Aa][Ii][Ll][@][Mm][Aa][Ii][Ll][.][Rr][Uu]/

$ ./regexery.sh 'version 9'
/[Vv][Ee][Rr][Ss][Ii][Oo][Nn].[9]/

$ ./regexery.sh 'example\sto\sdo'
/[Ee][Xx][Aa][Mm][Pp][Ll][Ee]\s[Tt][Oo]\s[Dd][Oo]/

$ ./regexery.sh 'backslashes\\are\\cool'
/[Bb][Aa][Cc][Kk][Ss][Ll][Aa][Ss][Hh][Ee][Ss][\][Aa][Rr][Ee][\][Cc][Oo][Oo][Ll]/

$ ./regexery.sh 'i need more space'
/[Ii].[Nn][Ee][Ee][Dd].[Mm][Oo][Rr][Ee].[Ss][Pp][Aa][Cc][Ee]/

$ ./regexery.sh 'this\"is"ok'
/[Tt][Hh][Ii][Ss]\"[Ii][Ss]["][Oo][Kk]/
```

# TODO
You say it. For what i need at work, i did everything that was necessary.

# Features
- [x] Backslash shortcuts
- [x] Double backslashes
- [x] Not repeating numbers
- [x] Tested with native UNIX and UNIX on Windows
