Preferred Format of Data Incoming to the CDW
=================

1. **file format**
    1. *plain text csv*: incoming files should be plain-text [csv](https://en.wikipedia.org/wiki/Comma-separated_values).  Not Excel or other proprietary or binary format.
    1. *cells enclosed in quotes*: a 'cell' should be enclosed in double quotes, especially if it's a string/character variable.
1. **date format**: use `YYYY-MM-DD` (*i.e.*, [ISO-8601](https://www.explainxkcd.com/wiki/index.php/1179:_ISO_8601))
1. **patient names**: separate the `name_last`, `name_first`, and `name_middle` when possible.
1. **consistency across versions**: Please use a script to produce the data sent to us, and inform us when changes occur.  Most of our processes are automated, and changes that are trivial to humans (*e.g.*, `yyyy-mm-dd` to `mm/dd-yy`) cause problems for the automation.