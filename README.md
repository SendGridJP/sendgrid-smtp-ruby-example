#sendgrid-smtp-ruby-example

This is an example of using the SendGrid via SMTP.

## Usage

```bash
git clone https://github.com/SendGridJP/sendgrid-smtp-ruby-example.git
cd sendgrid-smtp-ruby-example
cp .env.example .env
# change the values in .env
bundle install
ruby -f sendgrid-smtp-jis.rb
ruby -f sendgrid-smtp-utf8.rb
```

## Change the values in .env
.env is here:

```bash
SENDGRID_USERNAME=your_username
SENDGRID_PASSWORD=your_password
TOS=you@youremail.com,friend1@friendemail.com,friend2@friendemail.com
FROM=you@youremail.com
```
SENDGRID_USERNAME is the username of SendGrid.  
SENDGRID_PASSWORD is the password of SendGrid.  
TOS: Therecipient list that is comma seperated.  
FROM: From address.  


========================
 本コードはSendGridのSMTPサービスの利用サンプルです。

## 使い方

```bash
git clone https://github.com/SendGridJP/sendgrid-smtp-ruby-example.git
cd sendgrid-smtp-ruby-example
cp .env.example .env
# .envファイルを編集してください
bundle install
ruby -f sendgrid-smtp-jis.rb
ruby -f sendgrid-smtp-utf8.rb
```

## .envファイルの編集
.envファイルは以下のような内容になっています。

```bash
SENDGRID_USERNAME=your_username
SENDGRID_PASSWORD=your_password
TOS=you@youremail.com,friend1@friendemail.com,friend2@friendemail.com
FROM=you@youremail.com
```
SENDGRID_USERNAME:SendGridのユーザ名を指定してください。  
SENDGRID_PASSWORD:SendGridのパスワードを指定してください。  
TOS:宛先をカンマ区切りで指定してください。  
FROM:送信元アドレスを指定してください。  
