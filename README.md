# apiblueprint

## 事前に必要なもの

* node.js : v8.10.0 で動作確認しています。
* npm : aglio のインストールに必要です。
* aglio https://github.com/danielgtaylor/aglio
    * グローバルインストールが必要です。

## 使い方

`docs` ディレクトリ以下のすべての .md ファイルをまとめて API Blueprint として処理して、
.html ファイルを生成します。

* `update.sh` を cron 等に登録します
    * `*/1 * * * * /path/to/shell/update.sh`
* `craete_api_blueprint.sh` 内の作成先のファイルパス等を変更します
