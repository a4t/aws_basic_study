# 各chapterの説明
VPCの作成周りは1章参照

## chapter 1
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario3/images/chapter1.png "構成図")

### ネットワーク周りを作成
シナリオ1を参照

## chapter 2
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario3/images/chapter2.png "構成図")

### Launch ConfigurationとAuto Scaling Groupの作成

### Auto Scaling Group
EC2のインスタンスの台数をコントロールしたり、ネットワークのどこに立ち上げるかをコントロールするもの

CPUの使用率が何%以上になったら台数を増やすとかはここでコントロールする

### Launch Configuration
EC2のインスタンスをどのような設定で立ち上げるかを設定するもの

- OS: ubuntu or Amazon Linuxなどなど
- インスタンスタイプ t2.smallとかc4.large
- sshの接続鍵
- 起動スクリプトの設定

今回はNginxをインストールして /ping に応答するサーバを作成する

### Auto Scaling Group と Launch Configurationの関係
どのようなインスタンスを(Launch Configuration)

どのネットワークで何台立ち上げるか(Auto Scaling Group)

という関係

### 起動スクリプト(userdata)
ここでgit pullとかbundle installとかする

今回はnginxをインストールして、自分のインスタンスIDを返すページを作成する

## chapter 3
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario3/images/chapter3.png "構成図")

Auto Scaling Groupをいじってサーバを増やしてみる

https://ap-northeast-1.console.aws.amazon.com/ec2/autoscaling/home?region=ap-northeast-1#AutoScalingGroups:

そしてサーバが立ち上がったら各インスタンスのGlobal IPにアクセスする

それぞれ自分のインスタンスIPを返す

## chapter 4
ELBを作成する、LoadBalancer

![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario3/images/chapter4.png "構成図")

### Health Check
httpでアクセスして、200が返ってきたらそのサーバは正常に稼働と判断してELBに紐付ける
200以外を返す場合はサーバにトラブルが発生しているものとしてELBから切り離す

### Listeners
ユーザーからきた○○番ポートへのアクセスを○○番ポートに流すという設定を記述する

443 -> 80 に設定するとELBがSSLの処理を全て受け持ってくれるので各サーバにSSL証明書を置かなくていい

### 動作確認
ここからは手動対応になります(コードの都合上)

https://ap-northeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-northeast-1#LoadBalancers: に接続し自分の名前のELBを選択して

Instances -> Edit Instances でインスタンスを紐付けてください

インスタンスが紐付いたら、StatusがInServiceになるのでELBのDNS nameに接続してみる

何回か更新していると他のインスタンスIDが返ってくるようになる

## その他
https://ap-northeast-1.console.aws.amazon.com/ec2/autoscaling/home?region=ap-northeast-1#AutoScalingGroups:

自分のAutoScalingGroup -> Details -> Load Balancers で自分のELBを紐付ければわざわざELBに紐付ける作業をしなくて良くなる
