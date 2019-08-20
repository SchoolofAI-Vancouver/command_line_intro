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

## Resources

- [Learn Enough Command Line to be Dangerous](https://www.learnenough.com/command-line-tutorial/basics)
