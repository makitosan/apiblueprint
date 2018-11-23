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

    + Attributes
        + email: test@example.com (string, required) - メールアドレス（format: email）
        + password: abc123 (string, required) - パスワード（pattern: ^[0-9A-Za-z]{6,16}$）

+ Response 201 (application/json)

    + Attributes
        + accessToken: f58ba22059f5a8aa8f346e0f40987adab326041fac99029c909bef2c6300821a (string, required) - アクセストークン