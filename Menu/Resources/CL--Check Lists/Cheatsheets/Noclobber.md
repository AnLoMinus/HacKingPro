# noclobber

```shell
$ echo "Hello, world" >file.txt
$ cat file.txt
Hello, world
$ echo "This will overwrite the first greeting." >file.txt
$ cat file.txt
This will overwrite the first greeting.
$ set -o noclobber
$ echo "Can we overwrite it again?" >file.txt
-bash: file.txt: cannot overwrite existing file
$ echo "But we can use the >| operator to ignore the noclobber." >|file.txt
$ cat file.txt # Successfully overwrote the contents of file.txt using the >| operator
But we can use the >| operator to ignore the noclobber.
$ set +o noclobber # Changes setting back
```
