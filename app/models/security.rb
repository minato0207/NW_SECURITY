class Security < ActiveHash::Base

  self.data = [
    { id: 1, name: 'SQLインジェクション攻撃',                   text: 'SQL injection Attack'},
    { id: 2, name: 'OSコマンドインジェクション攻撃',            text: 'OS command injection Attack' },
    { id: 3, name: 'LDAPインジェクション攻撃',                  text: 'LDAP injection Attack' },
    { id: 4, name: 'DoS/DDoS攻撃',                              text: 'DoS/DDoS Attack' },
    { id: 5, name: 'クロスサイトスクリプティング攻撃',          text: 'XSS Attack' },
    { id: 6, name: 'ディレクトリ・トラバーサル攻撃',            text:'Directory traversal Attack' },
    { id: 7, name: 'ドライブバイダウンロード攻撃',              text: 'Drive by download Attack' },
    { id: 8, name: 'ゼロデイ攻撃',                              text: 'Zero-day Attack' },
    { id: 9, name: 'パスワードリスト攻撃',                      text:'Password list Attack' },
    { id: 10, name: 'ブルートフォースアタック（総当たり攻撃）', text: 'Brute force Attack' },
  ]
end
