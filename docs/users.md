FORMAT: 1A

# Group ユーザー
## ユーザーのエンドポイント [/api/v1/users]
### ユーザー登録 [POST]
#### 処理概要

* ユーザー情報を新しく登録する。
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

+ Parameters

    + id: `1` (number, required) - ユーザーID

### ユーザー取得 [GET]

#### 処理概要

* 該当 id のユーザー情報を返す。

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

### ユーザー更新 [PUT]

#### 処理概要

* 該当 id のユーザー情報を更新する。
* 退会等の処理をする場合には `ユーザー削除` を使用します。

+ Request User data (application/json)

    + Headers

            Accept: application/json
            X-App-API-Token: YOUR_API_TOKEN
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

    + Attributes
        + id: `1` (number, required) - ユーザーID
        + email: `user@example.com` (string) - メールアドレス
        + firstName: `Takeshi` (string) - 名
        + lastName: `Suzuki` (string) - 姓

+ Response 204

### ユーザー削除 [DELETE]

#### 処理概要

* 該当 id のユーザー情報を削除する。
* ユーザーの退会処理等に使用する。

+ Request User data (application/json)

    + Headers

            Accept: application/json
            X-App-API-Token: YOUR_API_TOKEN
            X-App-API-Access-Key: YOUR_API_ACCESS_KEY
            X-App-API-Access-Secret: YOUR_API_ACCESS_SECRET

    + Attributes
        + id: `1` (number, required) - ユーザーID

+ Response 204
