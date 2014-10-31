# -*- encoding: utf-8 -*-
require 'mail'
require 'dotenv'
require 'smtpapi'
require 'nkf'
require 'mail-iso-2022-jp'

Dotenv.load
sendgrid_username = ENV["SENDGRID_USERNAME"]
sendgrid_password = ENV["SENDGRID_PASSWORD"]
from = ENV["FROM"]
tos = ENV["TOS"].split(',')

# smtpapi
smtpapi = Smtpapi::Header.new
smtpapi.set_tos(tos)
smtpapi.add_substitution("fullname", ["田中 太郎", "佐藤 次郎", "鈴木 三郎"])
smtpapi.add_substitution("familyname", ["田中", "佐藤", "鈴木"])
smtpapi.add_substitution("place", ["office", "home", "office"])
smtpapi.add_section('office', '中野')
smtpapi.add_section('home', '目黒')
smtpapi.add_category('Category1')

mail = Mail.new(:charset => "ISO-2022-JP") do
  from from
  to tos
  subject "[sendgrid-smtp-ruby-example] フクロウのお名前はfullnameさん"
  add_file "./gif.gif"
end
mail["x-smtpapi"] = smtpapi.to_json

text_plain = Mail::Part.new do
  body (NKF.nkf('-j', "familyname さんは何をしていますか？\r\n 彼はplaceにいます。"))
  content_type "text/plain; charset=ISO-2022-JP"
end
text_html = Mail::Part.new do
  body (NKF.nkf('-j', "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。"))
  content_type "text/html; charset=ISO-2022-JP"
end
mail.part :content_type => "multipart/alternative" do |p|
  p.html_part = text_plain
  p.text_part = text_html
end

mail.delivery_method(:smtp,
  address: "smtp.sendgrid.net",
  port: 587,
  domain: "gmail.com",
  authentication: :login,
  user_name: sendgrid_username,
  password: sendgrid_password
)
mail.deliver
