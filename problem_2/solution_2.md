# Solution 2

The following command can be run from the directory where the data files are stored to identify those with fewer than $n$ values (in this case $n=100$).

```bash
$ wc * -w | grep -v <expected_number>
```
where `<expected_number>` is the expected number of values ($n$). In this particular case, the following command can be used:

```bash
$ wc * -w | grep -v 100
```

### How this works?
Here the `wc` command is used to count the number of words in each file (using `-w` switch). The result is piped into the `grep` command which filters all instances not having 100 values (the `-v` switch negates the match).
