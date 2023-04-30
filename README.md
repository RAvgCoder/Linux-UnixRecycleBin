# Linux-UnixRecycleBin

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)

## About <a name = "about"></a>

This is a little project of mine that I created to stop the fear you get from accidentally recursively deleting your directory, by creating something like a Windows recycle bin, where you move all your files which could then be deleted at a later time. It does this by using an alias it creates called `bin` to move your file into the recycle bin.



## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine. For usage, see [how to use](#deployment) section.

### Installing

1. Clone the repository.
``` bash
git clone https://github.com/RAvgCoder/Linux-UnixRecycleBin.git
```

2. In the directory, run the *__create_bin.sh* script.
```bash
./__create_bin.sh
```

3. Run this command on your terminal to finalize changes
```bash
source ~/.profile
````
4. Run `bin -e` to create the recycle bin on your home directory named **__RECYCLE_BIN**

5. Finally, enjoy the joy of never having to accidentally delete your files again.

## Usage <a name = "usage"></a>

The `bin` alias can be used like the `mv` command, the only difference being that it does not take in a destination folder, as it always goes to the recycle bin. 

##### Example to move to the recycle bin.

```bash
bin folders file other_stuf
```

Some extra flags have been added to make it easier to use, these are the list of supported ones. Because the bin alias is built around the `mv` command, its flags are supported too.

|Flags      |Description                                               |
|-----------|----------------------------------------------------------|
|`-h`       |Brings up a help menu for only the `bin` command          |
|`--help`   |Brings up a help menu for both the `bin` and `mv` command |
|`-e`       |Clears the recycle bin                                    |

##### Some flag usage examples 
To clear the bin 
```bash
bin -e
```
To get help for only `bin`
```bash
bin -h
```
To get help for both `bin` and  `mv`

## Important Notes
1. This program creates files on your computer in order to function properly, which may configuration files, and other data necessary for the program's operation. Please be aware of this before installing the program. 
The directories created are
- A `.profile` and or `.bashrc` file if it is not alredy on your machine. This helps the alias run when the machine is booted
- A `.bash_aliases` file if not already present which would store the alias comand it self **you can change the mapping from here**
- The `.__aliaseSymbols` direcory created in the home directory to store all necesary scipts needed to run the alias
- A `man_Recycle_bin.sh` and an `alias_Recycle_bin.sh` which contain the manual for the command and the scipt for the command respectively. This is located in the `.__aliaseSymbols` direcory, created above. 

2. Due to Unix's unique methods of handling files, putting anything in the `__RECYCLE_BIN` that already exists wouldn't be possible. So, I append the time format of `YYYY-MM-DD_HH:MM:SS` to the file being deleted to allow for the deletion of files. For example given an empty bin, after deleting a folder called *one*, the content of our bin would give.
```bash
one
```
If we delete two more with the same name it gives us
```bash
one
one-2023-04-29_21:15:02
one-2023-04-29_21:19:21
```
This property can be changed in the `~/.__aliaseSymbols/alias_Recycle_bin.sh` file

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
