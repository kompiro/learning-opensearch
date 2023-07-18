# Opensearchの実験場

## これは何？

Opensearchを利用する際に試した諸々を記録に残すためのリポジトリです。

## 前提条件

VSCode Devcontainer をセットアップ済みです。 Devcontainer で開くと下記のコンテナが自動で立ち上がります。

### Opensearch環境

クラスタモードで起動 & Opensearch Dashboard 付き

- opensearch-node1
- opensearch-node2
- opensearch-dashboard

### その他コンテナ

- development: OpeansearchをいじるためののRails環境です。Railsである必然性はありません。
- plantuml: 図等を執筆するために追加。

## 試し方

lib/tasks/opensearch.rake に index, document を生成するためのタスクを追加しています。

```sh
rails opensearch:info
```

で Opensearch が起動していることを確認してください。

テストデータを作成しやすくなるよう、 faker gem も導入済みです。

### index, document を生成する

```sh
rails opensearch:create_company_index
rails opensearch:create_company_v2_index
rails opensearch:create_employee_index
```

### index を削除する

```sh
rails opensearch:delete_indices
```

### query の実行結果を取得する

```sh
bundle ex ruby lib/learning.rb | jq .
```

### Opensearch Dashboard の使い方

- admin / adminでログインができる
- メニューから Opensearch Dashboards > Discover を開くと検索ができる

### 参考

- [Opensearch gem](https://github.com/opensearch-project/opensearch-ruby/)
- [faker gem](https://github.com/faker-ruby/faker)
