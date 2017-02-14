## Publicサーバにsshで接続する
00_connect.mdを参照

## Publicサーバ内に秘密鍵を設置
自分の秘密鍵を ~/.ssh/id_rsa に設置

```
$ vim ~/.ssh/id_rsa
$ chmod 400 ~/.ssh/id_rsa
```

## Private サーバに接続

```
$ ssh ubuntu@[PrivateサーバのPrivate IP]
```
