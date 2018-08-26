# Railsチュートリアル3章以降のアプリケーション

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
