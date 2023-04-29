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

4. Finally, enjoy the joy of never having to accidentally delete your files again.

## Usage <a name = "usage"></a>

The `bin` alias can be used like the `mv` command, the only difference being that it does not take in a destination folder, as it always goes to the recycle bin. 

##### Example to move to the recycle bin.

```bash
bin folders file other_stuf
```

Some extra flags have been added to make it easier to use, these are the list of supported ones. Because the bin alias is built around the `mv` command, its flags are supported too.

|Flags      |Description           |
|-----------|----------------------|
|`-h`       |Brings up a help menu |
|`--help`   |Brings up a help menu for both the `bin` and `mv` command |
|`-e`       |Clears the recycle bin|

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

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)