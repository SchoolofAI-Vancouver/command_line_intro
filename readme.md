# Command Line Introduction

<!-- MarkdownTOC -->

- [Set up System](#set-up-system)
- [Grabbing Data from the Web](#grabbing-data-from-the-web)
- [Resources](#resources)

<!-- /MarkdownTOC -->

This is an introduction to Command Line Workshop from the School of AI. There is a [Command Line References] document included for your convenience.


<a id="set-up-system"></a>
## Set up System

To ensure consistency, let's install the virtual machine from the [Learn Enough Command Line - 1.1 Introduction] section. For quick reference, the steps have been re-produced below:

1. Install the right version of [VirtualBox] for your system (free).
2. Download the [Learn Enough Virtual Machine] (large file).
3. Once the download is complete, double-click the resulting “OVA” file and follow the instructions to install the Virtual Machine (VM).
4. Double-click the VM itself and log in using the default user’s password, which is “`foobar!`”.

Once set up, open the `Terminal` application and run the following commands. You will be prompted for the password:

```bash
# run update
$ sudo apt update

# install pip3
$ sudo apt install python3-pip -y

# become root user
$ sudo su

# install csvkit
$ sudo pip3 install csvkit -y
```

Confirm the installations worked:

```bash
# verify pip3 was installed correctly
$ which pip3
/usr/bin/pip3

# verify csvkit was installed correctly
$ ll -tr /usr/local/bin/csv*
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvstat
-rwxr-xr-x 1 root root 381 Jul  7 14:12 /usr/local/bin/csvstack
-rwxr-xr-x 1 root root 377 Jul  7 14:12 /usr/local/bin/csvsql
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvsort
-rwxr-xr-x 1 root root 375 Jul  7 14:12 /usr/local/bin/csvpy
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvlook
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvjson
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvjoin
-rwxr-xr-x 1 root root 379 Jul  7 14:12 /usr/local/bin/csvgrep
-rwxr-xr-x 1 root root 383 Jul  7 14:12 /usr/local/bin/csvformat
-rwxr-xr-x 1 root root 377 Jul  7 14:12 /usr/local/bin/csvcut
-rwxr-xr-x 1 root root 381 Jul  7 14:12 /usr/local/bin/csvclean
```


<a id="grabbing-data-from-the-web"></a>
## Grabbing Data from the Web

There are a couple of tools we can use to grab data from the web.

- [`Wget`]
- [`cURL`]

For a comparison, please take a look at [curl vs Wget].

<a id="resources"></a>
## Resources

- [Data Science at the Command Line]
- [Learn Enough Command Line to be Dangerous]

[//]: # (References)

[Command Line References]: command_line_references.md
[Learn Enough Command Line - 1.1 Introduction]: https://www.learnenough.com/command-line-tutorial/basics#sec-introduction
[VirtualBox]: https://www.virtualbox.org/
[Learn Enough Virtual Machine]: https://softcover-static.s3.amazonaws.com/LearnEnough-v.1.4.ova
[`Wget`]: https://en.wikipedia.org/wiki/Wget
[`cURL`]: https://en.wikipedia.org/wiki/CURL
[curl vs Wget]: https://daniel.haxx.se/docs/curl-vs-wget.html
[Data Science at the Command Line]: https://www.datascienceatthecommandline.com/
[Learn Enough Command Line to be Dangerous]: https://www.learnenough.com/command-line-tutorial/basics
