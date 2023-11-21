# Solution 1
The extensions of a set of files in a given directory can be changed to a desired extension in different ways depending on your personal preference and prior familiarity with Linux CLI and Bash Scripting. Below, I outline two potential solutions:

## Method 1
In this command, we use several existing CLI utilities to achieve the desired outcome. All is need is to navigate to the directory where the files reside and execute the following command. Please note that in this particular example, all the files with a `csv` extension will be renamed to `dat` extension. These can be simply changed to convert files with any extension to any other extension.

```bash
$ ls *.csv | cut -d"." -f 1 | xargs -I {} mv {}.csv {}.dat
```
### How this works?
The `ls` command lists all the files in the current directory and pipes the output to the `cut` command. The `cut` command is used to extract the file name without the extension. This is then passed on to the `xargs` command which gives us the ability to run another command (`mv` in this case) on the output of another command (`cut` in this example). The variable `{}` is a placeholder for each filename which is subsequently used by the `mv` command to be renamed from the `csv` extension to `dat` extension.

I have packaged this into a Bash Script, which accepts both the current and the desired extension as arguments and does the conversion. This could be found in `problem_1` directory under the name `method1.sh`.

```bash
$ ls | cut -d"." -f 1 | xargs -I {} mv {}.$1 {}.$2
```

**Usage:**
```bash
$ ./method1.sh csv dat
```


## Method 2
As an alternative, if you feel more comfortable with Bash Scripts, you can use the following method to rename the files. Similar to the above, I have also created a script that can be run from the command-line.

1. Open Linux Terminal
2. Navigate to the directory containing the files using `cd` command. 
3. Run the following bash script:
```bash
for file in *.<current_extension>;
    do mv "$file" "${file/.<current_extension>/.<desired_extension>}";
done
```
were `<current_extension>` should be replaced with the current extension (`csv`) and `<desired_extension>` with the target extension (`dat`).

For this particular case you can run the following:
```bash
for file in *.csv; 
    do mv "$file" "${file/.csv/.dat}"; 
done
```
## How it works?
This script iterates over all the files with a `.csv` extension in the current directory and renames it by replacing the extension with `.dat`.

