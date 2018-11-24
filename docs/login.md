FORMAT: 1A

# Group ユーザ認証
## ユーザ認証エンドポイント [/api/v1/login]
### ユーザ認証 [POST]
#### 処理概要

* ユーザーを認証する。
* ユーザー認証に成功した場合、アクセストークンを返す。

+ Request (application/json)

    + Headers

            Accept: application/json
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

    + Attributes
        + email: test@example.com (string, required) - メールアドレス（format: email）
        + password: abc123 (string, required) - パスワード（pattern: ^[0-9A-Za-z]{6,16}$）

+ Response 201 (application/json)

    + Attributes
        + accessToken: f58ba22059f5a8aa8f346e0f40987adab326041fac99029c909bef2c6300821a (string, required) - アクセストークン

## 初期登録エンドポイント [/api/v1/init]

### デバイス初期登録 [POST]

#### 処理概要

* デバイスのIDを登録する。
* デバイスのID登録に成功した場合、アクセストークンと登録済みのユーザーステータスを返す。
* ユーザーステータスは initial:初期登録中 ready:初期登録済み tc:規約に同意必要 の3種類ある。
    * 初期登録済みでも規約変更で再度利用規約に同意が必要な場合には tc になる。
* アクセストークンは認証が必要なAPIの呼び出しに必要。

+ Request (application/json)

    + Headers

            Accept: application/json
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

    + Attributes
        + uid: `ABCDEF0123456789` (string, required) - 端末等を一意に識別する文字列

+ Response 201 (application/json)

    + Attributes
        + accessToken: `f58ba22059f5a8aa8f346e0f40987adab326041fac99029c909bef2c6300821a` (string, required) - アクセストークン
        + userStatus: `initial` (enum[string], required) - ユーザーステータス
            + Members
                + `initial`
                + `ready`
                + `tc`
