## 事前に覚えてほしいこと
### サブネットマスク
サブネットマスクは、ネットワークの範囲を定義するために使用

### 記述方法
- 以下の二つは同じである
  - 172.16.0.0 / 255.255.255.0
  - 172.16.0.0/24

この表記は 172.16.0.0 〜 172.16.0.255 までを指す

つまり、このネットワーク範囲にはIPが 256 がある

### サブネットマスクの計算方法
#### 前提知識
- そもそもIPv4が 0.0.0.0 〜 255.255.255.255 で表現されている
  - 8bit * 4 で 32bitで表現されています。

- 低レイヤーの話をすると、コンピュータは0と1しか扱えないので2進数に全て管理されている

つまり、各IPはこのように表現される

```
0.0.0.0         -> 00000000 00000000 00000000 00000000
255.255.255.255 -> 11111111 11111111 11111111 11111111
192.168.1.12    -> 11000000 10101000 00000001 00001100
```

#### 計算
サブネットマスクにはパターンがあるのでまずいくつか紹介

```
255.255.255.255 -> 11111111 11111111 11111111 11111111 -> /32
255.255.255.240 -> 11111111 11111111 11111111 11110000 -> /28
255.255.255.0   -> 11111111 11111111 11111111 00000000 -> /24
255.255.0.0     -> 11111111 11111111 00000000 00000000 -> /16
255.0.0.0       -> 11111111 00000000 00000000 00000000 -> /8
```

簡略化されたサブネットマスクの表記方法は、1の数ということがわかる

そして、0の部分が表現できるIPの数ということになる

```
/32 -> 1
/28 -> 16
/24 -> 256
/16 -> 65536
/8  -> 16777216
```

#### IPの範囲の指定
別に第4オクテットは0で始まらなくてもよい

```
192.168.1.12/28 -> 192.168.1.12 ~ 192.168.1.28
192.168.1.40/24 -> 192.168.1.40 ~ 192.168.2.40
```

#### 存在しないサブネットマスク
IPには必ずネットワーク部とホスト部がある

ネットワーク部は必ず `全て1であること`

```
255.255.0.0  -> 11111111 11111111 00000000 00000000
| netw | h |    |    network     |      host      |
```
以下のサブネットマスクは存在しない
```
255.255.255.253 -> 11111111 11111111 11111111 11111101
255.255.255.245 -> 11111111 11111111 11111111 11110101
```

# 各chapterの説明

## chapter 1
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/chapter1.png "構成図")

### VPCを作成
VPCを作成するということは仮想ネットワークを作成するということ

VPC間では基本的に通信ができないので、他のサービスに影響を受けることがない

## chapter 2
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/chapter2.png "構成図")

### Subnetを作成
Subnetを作成することで、サーバを立てた時に通信できるサーバ、できないサーバなど設計することができる(詳しくはchapter3)

## chapter 3
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/chapter3.png "構成図")
### Gatewayを作成
GatewayはAWSの中から外に通信するためのネットワークの出入り口

これがないということは、インターネット回線を契約していない自宅のPCをイメージすると良い

そしてインターネット回線に繋がっていないサーバは、AWS上にあっても接続できないので何もできない

### route tableを作成
これはサブネットに対してネットワークのルールを適用するためにある

- 例えば https://www.google.co.jp/ にアクセスしたい場合どういった経路を通るかを指定することができる
  - 今回の場合で言えばGatewayを作成したので、Gatewayを通ってGoogleにアクセスするという設定をすることになる

- そして外部と通信してほしくないサブネットに関しては、Gatewayと紐付けない
  - そうすることでAWSの外からアクセスできないネットワークを作ることができる

### subnetをroute tableに紐付け
作ったroute tableに対してsubnetを紐付けする

## chapter 4
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/chapter4.png "構成図")
### Security Groupの作成
Publicなところにサーバを立てるのであれば、アクセスできるIPと、アクセスできるPortの制限が必要

IP制限やPort制限かけずに誰でもアクセスできるとリスクは高くなる

### Publicの場所にEC2を作成
- EC2ではOSがインストールされただけのまっさらな状態をベースに構築する
  - Amazon Linux
  - Red Hat Enterprise Linux
  - Ubuntu
  - Windows Server

- スペックも選べる
  - t2.nano    CPU:1,  Memory: 0.5G
  - t2.small   CPU:1,  Memory: 1G
  - c4.large   CPU:2,  Memory: 7,5G
  - c4.8xlarge CPU:36, Memory: 60G

- sshで接続するための鍵指定
  - 最初に作成してもらった鍵はここで使用する
    - ubuntuで言えば ssh ubuntu@[Public IP]
    - AmazonZ Linuxはで ssh ec2-user@[Public IP]

### Privateの場所にEC2を作成
Publicサーバと同様

## chapter 5
### sshでPublicサーバ接続
Publicなので問題なく接続できる

Private側は接続できない

### Nginxをインストールしてアクセス
PublicサーバでNginxをインストールしてブラウザやcurlで接続してみる

### sshでPrivateサーバに接続してみる
Publicサーバを経由しないと接続は絶対にできない

1. Gatewayと繋がっていない

2. たとえGatewayと繋がっていてもIP制限で入れない

### Privateサーバで外部と接続してみる
- curl で yahoo.co.jp に接続してみる
- Publicサーバと同様の方法で、Nginxをインストールしてみる

## chapter 6
現実の物理的な物で考える

### VPCを作る
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_1.png "構成図")

### Subnetを作る
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_2.png "構成図")

### サーバを立てる
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_3.png "構成図")

### ルーティングする
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_4.png "構成図")

### AWSに当てはめる
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_5.png "構成図")

### 新しいSubnetを作成する
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/real_6.png "構成図")
