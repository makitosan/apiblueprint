FORMAT: 1A

# Group ユーザ
## ユーザのエンドポイント [/api/v1/users]
### ユーザ登録 [POST]
#### 処理概要

* ユーザ情報を新しく登録する。
* 登録に成功した場合、アクセストークンを返す。

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


## ユーザのエンドポイント [/api/v1/users/{id}]
### ユーザ取得 [GET]
#### 処理概要

* 該当 id のユーザ情報を返す。

+ Parameters

    + id: `1` (number, required) - ユーザID

+ Request User data

    + Headers

            Accept: application/json
            X-App-API-Token: YOUR_API_TOKEN
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

+ Response 200 (application/json)

    + Headers

            X-Performance-Msec: 52

    + Body

            {
              "id": 1,
              "email": "user@example.com",
              "firstName": "Takeshi",
              "lastName": "Suzuki"
            }
