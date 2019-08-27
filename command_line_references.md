# Command Line References

This is an reference page for the tools we use throughout the Command Line Workshop.

![Command Line Image](https://softcover.s3.amazonaws.com/636/learn_enough_command_line/images/figures/anatomy.png)

Print to the screen: `echo`

```bash
$ echo hello
hello
```

Look at a command's manual page: `man`

```bash
$ man echo
```


## Navigation

Print the working directory: `pwd`

```bash
$ pwd
/home/johannes/Documents/school_of_ai_vancouver/command_line_intro
```

List files and folders: `ls`

```bash
$ ls
readme.md
```

Make directories: `mkdir`

```bash
$ mkdir tools
$ ls -F
readme.md  tools/
```

Changing directories: `cd`

```bash
$ cd tools/
```

Creating new files: `touch`

```bash
touch document.txt
```

Listing directory structures: `tree`

```bash
$ tree -F
.
├── readme.md
└── tools/
```

Copy files and directories: `cp`

```bash
$ cp readme.md tools/
$ ls tools/
readme.md
```

Move files and directories: `mv`

```bash
$ touch new-document.txt
$ mv new-document.txt tools/
$ ls tools/
new-document.txt  readme.md
```

Delete files and directories: `rm`

```bash
$ rm <file>
$ rm -r <directory>/
```

Wildcards: `*`

We can use wildcards to search or select groups of files.

```bash
$ ls *sh
create_packtpub_products_list.sh  extract_contents.sh  get_packtpub_products_pages.sh
```

Command Options: `-l`, `-a`, `-h`

Command options allow us to modify the behavior of shell commands.

```bash
$ ls *sh
create_packtpub_products_list.sh  extract_contents.sh  get_packtpub_products_pages.sh

$ ls -l *sh
-rwxrwxr-x 1 johannes johannes 1072 Aug 18 18:13 create_packtpub_products_list.sh
-rwxrwxr-x 1 johannes johannes 1271 Aug 18 10:35 extract_contents.sh
-rwxrwxr-x 1 johannes johannes  615 Aug 18 16:38 get_packtpub_products_pages.sh
```

Locate a command: `which`

```bash
$ which man
/usr/bin/man
 
$ which which
/usr/bin/which

$ which ls
/bin/ls
```

Find files by name: `locate`, `find`

```bash
$ locate create_packtpub_products_list.sh 
/home/johannes/Documents/school_of_ai_vancouver/command_line_intro/tools/create_packtpub_products_list.sh
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/create_packtpub_products_list.sh
```

## Useful Tools

`wc`: print newline, word, and byte counts for each file

```bash
$ wc readme.md 
  79  385 2972 readme.md
 
$ wc -l readme.md 
79 readme.md

$ wc -c readme.md 
2972 readme.md

$ wc -w readme.md 
385 readme.md
```

`head`: output the first part of files

```bash
$ head readme.md 
# Command Line Introduction

<!-- MarkdownTOC -->

- [Command Line References](#command-line-references)
  - [Navigation](#navigation)
  - [Useful Tools](#useful-tools)
  - [Text Search & Processing](#text-search--processing)
  - [Grabbing data from the web](#grabbing-data-from-the-web)
  - [External Tools](#external-tools)
    - [entr](#entr)
    - [CSVKit](#csvkit)
    - [jq](#jq)

<!-- /MarkdownTOC -->
```

`tail`: output the last part of files

```bash
$ tail readme.md 

[Command Line References]: command_line_references.md
[Learn Enough Command Line - 1.1 Introduction]: https://www.learnenough.com/command-line-tutorial/basics#sec-introduction
[VirtualBox]: https://www.virtualbox.org/
[Learn Enough Virtual Machine]: https://softcover-static.s3.amazonaws.com/LearnEnough-v.1.4.ova
[`Wget`]: https://en.wikipedia.org/wiki/Wget
[`cURL`]: https://en.wikipedia.org/wiki/CURL
[curl vs Wget]: https://daniel.haxx.se/docs/curl-vs-wget.html
[Data Science at the Command Line]: https://www.datascienceatthecommandline.com/
[Learn Enough Command Line to be Dangerous]: https://www.learnenough.com/command-line-tutorial/basics
```

## Text Search & Processing

`awk`: pattern scanning and text processing language

```bash
$ ls -tlr | awk -F' ' '{print $6,$7,$8,$9}'
   
Aug 18 09:35 readme.md
Aug 18 12:54 wget-log
Aug 18 12:54 page8.html
Aug 18 12:58 page9.html
Aug 18 16:37 downloads
Aug 18 16:38 get_packtpub_products_pages.sh
Aug 18 17:33 list_pp.txt
Aug 18 17:55 text.txt
Aug 18 18:13 create_packtpub_products_list.sh
Aug 18 18:13 2019-08-18-packtpub-products.csv
Aug 20 18:40 awesome-machine-learning-books.html
Aug 20 18:50 2019-08-20-packtpub-products.csv
Aug 25 22:46 awesome-machine-learning-books.md
Aug 25 23:04 commands.md
Aug 25 23:19 extract_contents.sh
```

`sed`: stream editor for filtering and transforming text

```bash
$ echo 'hello' | sed 's/h/j/'
jello
```

`grep`: print lines matching a pattern

```bash
$ grep 'virtual' readme.md 
To ensure consistency, let's install the virtual machine from the [Learn Enough Command Line - 1.1 Introduction] section. For quick reference, the steps have been re-produced below:
[VirtualBox]: https://www.virtualbox.org/

$ grep -i 'virtual' readme.md 
To ensure consistency, let's install the virtual machine from the [Learn Enough Command Line - 1.1 Introduction] section. For quick reference, the steps have been re-produced below:
1. Install the right version of [VirtualBox] for your system (free).
2. Download the [Learn Enough Virtual Machine] (large file).
3. Once the download is complete, double-click the resulting “OVA” file and follow the instructions to install the Virtual Machine (VM).
[VirtualBox]: https://www.virtualbox.org/
[Learn Enough Virtual Machine]: https://softcover-static.s3.amazonaws.com/LearnEnough-v.1.4.ova
```

`column`: columnate lists

```bash
$ $ jq -r '.[] | [._id, .age, .isActive] | @tsv' file1.json
5d64c0dda4a2d985f9cb441c	27	true
5d64c0dd578455721f3bd851	20	true
5d64c0dd0e5c490608066ede	34	true
5d64c0dd3455dd0d6776c2d9	27	true
5d64c0dd84e1f9842cc97d81	20	false

# column -t helps create a table out of the output of the previous command
$ jq -r '.[] | [._id, .age] | @tsv' file1.json | column -t
5d64c0dda4a2d985f9cb441c  27
5d64c0dd578455721f3bd851  20
5d64c0dd0e5c490608066ede  34
5d64c0dd3455dd0d6776c2d9  27
5d64c0dd84e1f9842cc97d81  20
```

## Grabbing data from the web

There are a couple of tools we can use to grab data from the web.

- [`Wget`]
- [`cURL`]

For a comparison, please take a look at [curl vs Wget].

## External Tools

These are tools we will cover that do not pre-installed on Ubuntu, which is what we are using for this workshop.

### entr

`entr`: run arbitrary commands when files change (Need to install)

```bash
$ echo get_packtpub_products_pages.sh | entr -c bash get_packtpub_products_pages.sh
```

### CSVKit

[csvkit] is a _suite of command-line tools for converting to and working with CSV, the king of tabular file formats_.

- **csvstack**: for stacking rows from multiple CSV files.
- **csvlook**: renders CSV in pretty table format
- **csvcut**: for selecting specific columns 
- **csvstat**: for calculating descriptive statistics for some or all columns
- **csvgrep**: for filtering tabular data using specific criteria

### jq

[`jq`] is a lightweight and flexible command-line JSON processor.


[//]: # (References)

[`Wget`]: https://en.wikipedia.org/wiki/Wget
[`cURL`]: https://en.wikipedia.org/wiki/CURL
[curl vs Wget]: https://daniel.haxx.se/docs/curl-vs-wget.html
[csvkit]: https://csvkit.readthedocs.io/en/latest/
[`jq`]: https://stedolan.github.io/jq/