FORMAT: 1A

# Group システム
## システムバージョンチェックエンドポイント [/api/v1/system/version]
### システムバージョンチェック [POST]
#### 処理概要

* デバイスのバージョンがサーバー側で受け入れられるかどうかを検証する。
* デバイスのバージョンが許容されるなら updateRequired は false 、アップデーが必要なら true を返す。

+ Request (application/json)

    + Headers

            Accept: application/json
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

    + Attributes

        + version: `12.03` (string, required) - メールアドレス（format: email）
        + device: `ios` (enum[string], required) - デバイス種別
            + Members
                + `ios`
                + `android`
                + `pc`

+ Response 200 (application/json)

    + Attributes
        + updateRequired: true (boolean, required) - アップデートが必要かどうか

## システムステータスエンドポイント [/api/v1/system/status]
### システムステータス [GET]
#### 処理概要

* サーバーのステータスを返す。
* サーバーのAPIの情報（バージョン等）を返す。

+ Request (application/json)

    + Headers

            Accept: application/json
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

+ Response 200 (application/json)

    + Headers

            X-App-API-Version: 1.09

    + Attributes

        + version: `1.09` (string, required) - API側のバージョン
        + status: `ok` (string, required) - サーバーのステータス
        + domain: `api.example.com` (string, required) - サーバーのドメイン
