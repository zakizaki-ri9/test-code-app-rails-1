
# Railsチュートリアル3章以降のアプリケーション

## URL(heroku)

https://ror-ttl-sample-zackey-app-1.herokuapp.com/

## 主に学べること

- minitestを用いた簡単なテストコード
- ルーティング
- yieldを用いた親子ビュー系の処理
- アセットパイプライン
    - 詳しいことは[自分のブログ](http://kic-yuuki.hatenablog.com/entry/2018/08/17/183031)参照
- BootStrapによるレイアウト適用
- パーシャル（部分ビュー）
- URL
    - 意図したURLに変更する場合は以下のような感じ
    - `get '/free_name' to: 'controller_name/method_name', as: 'free'`
        - `as`有りなら`free_url,free_path`
        - `as`無しなら`free_name_url,free_name_path`

# RSpecを理解するために参考にした記事

## 参考

- 事始め
    - 主に導入〜modelに対してのテスト記述- 
    - https://www.sejuku.net/blog/47847
- it(integration_test＝コントローラー)の書き方
    - https://blog.naichilab.com/entry/2016/01/19/011514
- できれば以下を購入したいところ
    - https://leanpub.com/everydayrailsrspec-jp
        - 買った

## 勉強メモ

### 用語

- テストスイート
    - 多数のテストケースを束ねたもののこと　
    - 一応参考記事↓
    - http://www.itmedia.co.jp/im/articles/1111/07/news187.html

### 環境準備

- Gemfileへ`rspec-rails`を追記
- `bundle install --without production`実行
- `rails g rspec:install`実行

上記の情報は以下Rubyistのページにも記載されている。
https://magazine.rubyist.net/articles/0021/0021-Rspec.html#rspec-%E3%81%A8%E3%81%AF%E4%BD%95%E3%81%8B

### メモ

- `.rspec`
    - 設定ファイル
    - `--format documentation`を追記することでRSpecの結果が見やすくなる
    - こんなに違う（以下コード参照）

```
## ---追記前---
$ bin/rspec
Running via Spring preloader in process 8975
..

Finished in 0.11803 seconds (files took 0.30191 seconds to load)
2 examples, 0 failures

## ---追記後---
$ bin/rspec
Running via Spring preloader in process 9003

UsersController
  GET #edit
    リクエスト200OKであること
    editテンプレートが選択されていること

Finished in 0.09904 seconds (files took 0.27824 seconds to load)
2 examples, 0 failures
```

- `binstub`
    - テストスイートの起動時間を早くする
        - Gemfileへ`spring-commands-rspec`を追記

