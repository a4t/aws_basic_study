# aws_basic_study

これはAWSの構成の基本パターンを学ぶためのチュートリアルです。

対象者はサーバにsshで入れたらなんとかなると思います。

## 必須環境
Docker と Docker Compose

## 環境構築
config ディレクトリ内のenvファイルを各自、反映させること。

target.env はシナリオの進行にあわせて変更してください。

## シナリオの見方
AWSの構築方法は全てTerraformで書かれています。

しかし、Terraformに関してはそれほど意識しなくても理解できるようにはなっています。

terraform/scenarios 内に シナリオ番号とチャプターがあります。

また各チャプターの状態を示す画像も入っているためそこと照らし合わせて見ると構成がイメージしやすいです。

## 各シナリオについて

### シナリオ 1
Public と Private の領域にサーバを一つずつ置いて各役割を確認

![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario1/images/chapter4.png "構成図")

### シナリオ 2
Availability Zone を使った障害対策

![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/chapter4.png "構成図")


### シナリオ 3
ELBを使ったWebサーバ分散パターン

### シナリオ 4
IAM Roleを使ったAWSリソースの権限管理
