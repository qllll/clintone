# Clintone

```sh
$ mix deps.get
$ mix escript.build

$ echo "fooBar hogeFuga" | ./clintone -s
foo_bar hoge_fuga
$ echo "foo_bar hoge_fuga" | ./clintone -c
fooBar hogeFuga
$ pbpaste | ./clintone -s | pbcopy
```

