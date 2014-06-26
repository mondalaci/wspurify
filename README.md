wspurify is a whitespace cleanup utility
========================================

```
$ wspurify
Usage: wspurify FILE
Remove every whitespace from the end of each line and remove every blank line from the end of the file.
This utility is only supposed to work on plain text files having Unix newlines; binary files are ignored.
```

As you may already suspect you should first download wspurify, then make it executable and finally save it as "wspurify" into a directory that is featured in your $PATH.

After that, you are encouraged to cast loose this beast on any directory tree:

```bash
find -type f -not -path '*/\.*' -exec wspurify {} \;
```

In case you have any non-Unix textfiles you're free to convert them using the well-known fromdos utility:

```bash
find -type f -not -path '*/\.*' -exec fromdos {} \;
```

To measure the efficiency of the purification you may want to sum the size of all the files in a given directory before and after the purification by using this command:

```bash
find -type f -exec stat -c %s {} \; | awk '{s+=$0} END {print s}'
```
