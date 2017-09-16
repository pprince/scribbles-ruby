Simple ISBN-10 & ISBN-13 Validator (exercise)
=============================================

**Note:** I wrote and tested this using **`Ruby 2.3`**.  It *will not* work
(without some adjustments) on `Ruby 2.2` or earlier.

(**Aside:** If I had targeted `Ruby 2.4` instead, I could have replaced `.reduce(:+)`
with the more readable `.sum`…)

Files
-----

```
./
├── run_me.rb         MY MAIN SCRIPT… does the file I/O and CSV formatting.
├── isbn.rb           MY MODULE… provides the Isbn.valid?() etc. functions.
├── sampledata.txt    Sample input… contains both valid and invalid ISBNs.
├── OUT.csv           Sample output… actual program output (for reference.)
├── README.md
└── old/
    ├── isbn_class.rb              My first ever attempt at writing a Ruby class.
    └── isbn_check_functions.rb    My follow-up to above; much simpler, no classes.
```
