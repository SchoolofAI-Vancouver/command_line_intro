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

Concate and print files: `cat`

```bash
$ cat /etc/passwd
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode.  At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
```

Combine multiple files together: `|`

```bash
# get file counts of all packtpub_products.html_* files
$ cat packtpub_products.html_* | wc -l
27078

# look for all <h1 tags
$ cat packtpub_products.html_* | grep -in '<h1'
639:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
3277:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
5987:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
8737:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
11531:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
14301:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
16967:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
19674:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
22341:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
24979:<h1 class="page-title" id="page-title-heading" aria-labelledby="page-title-heading toolbar-amount">
```

Read large files: `less` or `more`

```bash
# able to see all the packtpub_products.html_ files as one huge file we can scroll up and down through
$ cat packtpub_products.html_* | less
```

Re-directing output: `>`, `>>`

Use `>` to over-write
Use `>>` to append

```bash
# print to file
$ echo 'hello world' > hello.txt

$ cat hello.txt 
hello world

$ echo 'goodbye world' > hello.txt

$ cat hello.txt 
goodbye world

$ echo 'hello world' > hello.txt

$ echo 'goodbye world' >> hello.txt

$ cat hello.txt 
hello world
goodbye world
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
    - [rename](#rename)

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

`seq`: print a sequence of numbers

```bash
$ seq 10
1
2
3
4
5
6
7
8
9
10
```

`date`: print or set the system date and time

```bash
$ date
Mon 26 Aug 23:07:57 PDT 2019

$ date +"%F"
2019-08-26

$ date +"%Y-%M-%d %H-%m-%S %z"
2019-08-26 23-08-38 -0700

$ date +"%Y-%M-%d %H-%m-%S %Z"
2019-08-26 23-08-41 PDT
```

`read`: read from a file descriptor

```bash
file_name="readme.md"

while read -r line
do
    echo $line
done <<< "$file_name"
```

`truncate`: shink or extend the size of a file to the specified size

```bash
# emtpy file.log
$ truncate --size=0 file.log 
```

`xargs`: build and execute command lines from standard input

```bash
$ search_files="/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html*"
 
$ echo "$search_files"
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html*

# search files expanded
$ echo $search_files 
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_10
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_2
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_3
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_4
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_5
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_6
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_7
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_8
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_9

# result of grep command
$ grep -A1 'product-item-link' $search_files | head
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/data/what-s-new-in-tensorflow-2-0">
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-What&#039;s New in TensorFlow 2.0 </a>
--
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/uncategorized/ux-lifecycle">
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-UX Lifecycle </a>
--
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/business-other/the-bdd-books-discovery">
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-The BDD Books - Discovery </a>
--
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/business-other/microsoft-dynamics-365-business-central-cookbook">


# xargs allows us to take and reformat the output of grep command
$ grep -A1 'product-item-link' $search_files | xargs -n3 -d'\n' | head
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/data/what-s-new-in-tensorflow-2-0"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-What&#039;s New in TensorFlow 2.0 </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/uncategorized/ux-lifecycle"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-UX Lifecycle </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/business-other/the-bdd-books-discovery"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-The BDD Books - Discovery </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/business-other/microsoft-dynamics-365-business-central-cookbook"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Microsoft Dynamics 365 Business Central Cookbook </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/programming/mastering-visual-studio-2019-second-edition"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Mastering Visual Studio 2019 - Second Edition </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/cloud-networking/mastering-gitlab-12"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Mastering GitLab 12 </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/uncategorized/mastering-blockchain-programming-with-solidity"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Mastering Blockchain Programming with Solidity </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1: <a class="product-item-link" href="https://www.packtpub.com/cloud-networking/mastering-active-directory-second-edition"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Mastering Active Directory - Second Edition </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/big-data-and-business-intelligence/hands-deep-learning-go"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Hands-On Deep Learning with Go </a> --
/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1:<a class="product-item-link" href="https://www.packtpub.com/data/hands-on-artificial-intelligence-for-cybersecurity"> /home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html_1-Hands-On Artificial Intelligence for Cybersecurity </a> --
...

# in actual script, save it to variable
all_products=$(grep -A1 'product-item-link' $search_files | xargs -n3 -d'\n')
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

[`Wget`]: The non-interactive network downloader
[`cURL`]: transfer a URL

For a comparison, please take a look at [curl vs Wget].

## External Tools

These are tools we will cover that do not pre-installed on Ubuntu, which is what we are using for this workshop.

### entr

[`entr`]: run arbitrary commands when files change (Need to install)

```bash
$ echo get_packtpub_products_pages.sh | entr -c bash get_packtpub_products_pages.sh
```

### CSVKit

[`csvkit`] is a _suite of command-line tools for converting to and working with CSV, the king of tabular file formats_.

- **csvstack**: for stacking rows from multiple CSV files.
- **csvlook**: renders CSV in pretty table format
- **csvcut**: for selecting specific columns 
- **csvstat**: for calculating descriptive statistics for some or all columns
- **csvgrep**: for filtering tabular data using specific criteria

### jq

[`jq`] is a lightweight and flexible command-line JSON processor.

```bash
$ jq . file.json
[
  {
    "_id": "5d64c0dda4a2d985f9cb441c",
    "index": 0,
    "guid": "e86d8a89-8da1-401c-a4ec-88104675be23",
    "isActive": true,
    "balance": "$3,531.95",
    "picture": "http://placehold.it/32x32",
    "age": 27,
    "eyeColor": "brown",
...
      },
      {
        "id": 2,
        "name": "Hodges Velez"
      }
    ],
    "greeting": "Hello, Hickman! You have 5 unread messages.",
    "favoriteFruit": "banana"
  }
]
```

### rename

[`rename`]: renames multiple files

Rename multiple \*md\* files into \*html\* files:

```bash
$ ll
total 6244
drwxrwxr-x 2 johannes johannes   4096 Aug 26 23:01 ./
drwxrwxr-x 4 johannes johannes   4096 Aug 26 22:59 ../
-rw-rw-r-- 1 johannes johannes   5061 Aug 18 12:39 all_product_titles.txt
-rw-rw-r-- 1 johannes johannes 631093 Aug 20 18:44 packtpub_products.md_1
-rw-rw-r-- 1 johannes johannes 636387 Aug 20 18:44 packtpub_products.md_10
-rw-rw-r-- 1 johannes johannes 637153 Aug 20 18:44 packtpub_products.md_2
-rw-rw-r-- 1 johannes johannes 639204 Aug 20 18:44 packtpub_products.md_3
-rw-rw-r-- 1 johannes johannes 638031 Aug 20 18:44 packtpub_products.md_4
-rw-rw-r-- 1 johannes johannes 634188 Aug 20 18:44 packtpub_products.md_5
-rw-rw-r-- 1 johannes johannes 635189 Aug 20 18:44 packtpub_products.md_6
-rw-rw-r-- 1 johannes johannes 634101 Aug 20 18:44 packtpub_products.md_7
-rw-rw-r-- 1 johannes johannes 632743 Aug 20 18:44 packtpub_products.md_8
-rw-rw-r-- 1 johannes johannes 636621 Aug 20 18:44 packtpub_products.md_9

# dry run to verify correct name change
$ rename -n 's/md/html/' *md*
rename(packtpub_products.md_1, packtpub_products.html_1)
rename(packtpub_products.md_10, packtpub_products.html_10)
rename(packtpub_products.md_2, packtpub_products.html_2)
rename(packtpub_products.md_3, packtpub_products.html_3)
rename(packtpub_products.md_4, packtpub_products.html_4)
rename(packtpub_products.md_5, packtpub_products.html_5)
rename(packtpub_products.md_6, packtpub_products.html_6)
rename(packtpub_products.md_7, packtpub_products.html_7)
rename(packtpub_products.md_8, packtpub_products.html_8)
rename(packtpub_products.md_9, packtpub_products.html_9)

# make name change
$ rename 's/md/html/' *md*
 
# verify name change
$ ll
total 6244
drwxrwxr-x 2 johannes johannes   4096 Aug 26 23:01 ./
drwxrwxr-x 4 johannes johannes   4096 Aug 26 22:59 ../
-rw-rw-r-- 1 johannes johannes   5061 Aug 18 12:39 all_product_titles.txt
-rw-rw-r-- 1 johannes johannes 631093 Aug 20 18:44 packtpub_products.html_1
-rw-rw-r-- 1 johannes johannes 636387 Aug 20 18:44 packtpub_products.html_10
-rw-rw-r-- 1 johannes johannes 637153 Aug 20 18:44 packtpub_products.html_2
-rw-rw-r-- 1 johannes johannes 639204 Aug 20 18:44 packtpub_products.html_3
-rw-rw-r-- 1 johannes johannes 638031 Aug 20 18:44 packtpub_products.html_4
-rw-rw-r-- 1 johannes johannes 634188 Aug 20 18:44 packtpub_products.html_5
-rw-rw-r-- 1 johannes johannes 635189 Aug 20 18:44 packtpub_products.html_6
-rw-rw-r-- 1 johannes johannes 634101 Aug 20 18:44 packtpub_products.html_7
-rw-rw-r-- 1 johannes johannes 632743 Aug 20 18:44 packtpub_products.html_8
-rw-rw-r-- 1 johannes johannes 636621 Aug 20 18:44 packtpub_products.html_9
```

[//]: # (References)

[`Wget`]: https://en.wikipedia.org/wiki/Wget
[`cURL`]: https://en.wikipedia.org/wiki/CURL
[curl vs Wget]: https://daniel.haxx.se/docs/curl-vs-wget.html
[`entr`]: http://eradman.com/entrproject/
[`csvkit`]: https://csvkit.readthedocs.io/en/latest/
[`jq`]: https://stedolan.github.io/jq/
[`rename`]: https://www.cyberciti.biz/faq/linux-rename-file/
