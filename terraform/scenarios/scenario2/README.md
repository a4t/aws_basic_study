## 事前に覚えてほしいこと

### Availability Zone (AZ)
Availability Zoneはサービスの可用性を上げるために使用されます。

図はAWS側がデータセンターの位置を公開していないため適当な場所です。

### 3台あるうちのどれかにアクセス
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/real_1.png "構成図")

### ダウンしてたから他のサーバにアクセス
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/real_2.png "構成図")

### さらにダウンしてたので別のサーバにアクセス
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/real_3.png "構成図")

# 各chapterの説明

## chapter 1
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/chapter1.png "構成図")

### VPCを作成
シナリオ1を参照

## chapter 2
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/chapter2.png "構成図")

### Subnetを作成
シナリオ1と同じだが今回は4つ作成し、複数のAvailability Zoneに展開している

## chapter 3
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/chapter3.png "構成図")

### Gatewayを作成
### route tableを作成
シナリオ1参照

### subnetをroute tableに紐付け
今回は複数のSubnetが一つのRoute Tableに入っている

## chapter 4
![構成図](https://github.com/a4t/aws_basic_study/blob/master/terraform/scenarios/scenario2/images/chapter4.png "構成図")

### Security Groupの作成
### Publicの場所にEC2を作成
### Privateの場所にEC2を作成
シナリオ1参照
