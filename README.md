__sievegen__ is a collection of scripts to help you keep track of
and configure randomly generated email aliases on a domain you own.

It comes with two tools:

  - `sg-newalias`: an interactive wizard to generate a new email
    address to use as an alias
  - `sg-update`: a tool to generate a Sieve script from your aliases
    and upload it to a ManageSieve-compatible server

It is intended to be used with a domain that has a catch-all defined.
Since catch-alls tend to accumulate spam, a Sieve filter is generated
that only lets your registered aliases through to your inbox and
moves everything else to spam.

In a way you could say this is like AnonAddy built on top of
ManageSieve (kinda-sorta).

## Credits

The wordlists for randomly generated email addresses were taken from
these projects who were kind enough to share them:

  - `en_adjectives`: https://github.com/ulif/diceware
  - `en_nouns`: https://github.com/ulif/diceware
  - `first_names`: https://github.com/dominictarr/random-name
  - `names`: https://github.com/dominictarr/random-name

Also shoutouts to the [managesieve](https://gitlab.com/htgoebel/managesieve)
library which is manages to manage ManageSieve.

## License

As-is GPL 3.0 or later because the Diceware wordlists are licensed
under the GPL. If you remove the Diceware wordlists, you can also
consume everything in this repository under the MIT license.

A copy of both licenses should be attached.
