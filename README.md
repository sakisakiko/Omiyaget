# おみやGET!

## サイト概要
旅先などで実際に購入したお土産の情報を投稿し、共有できるサイトです。
また、条件で絞り込み検索を行うことで日本全国のお土産を探すことができます。

![Omiyaget_image](https://user-images.githubusercontent.com/108504337/212346784-24aa32e8-b547-4297-9929-f4c33afcc885.png)

サイトはこちらから：[おみやGET!](http://35.170.123.8/)

### サイトテーマ
より多くのお土産を
発見したり、共有できるようにするサイト。

### テーマを選んだ理由
私は旅先でお土産を買う際いつも悩んでしまいます。
定番のお土産を購入しても良いのですが、誰かに渡すとなると前にもらったことがあるかも？と悩んだり、
よく行く場所であると毎回結局同じものを購入してしまうということがあります。
せっかくなら良いものを選びたいけれど調べると意外と難しい。
そこで、他人がオススメするお土産を閲覧したり、自分がよかったと感じたお土産の情報を発信して
お互いにシェアできれば旅行ももっと楽しくなるのではないかと思い、このテーマにしました。

### ターゲットユーザー
旅行に行く人

### 主な利用シーン
旅行先などでお土産を検索することができる。自分が購入したお土産の情報を発信することができる。

## 実装機能一覧
- ユーザー認証(devise)
- いいね機能
- コメント機能
- フォロー機能
- ブックマーク機能
- 投稿に対するタグ付け
- 検索、絞り込み機能
- 星による５段階評価(jQuery)
- 画像アップロード機能(ActiveStorage)
- マップ表示(Google Maps API)

詳細はこちら：[実装機能](https://docs.google.com/spreadsheets/d/1PK4ZMlgzPtUXjw5JPEohkg76LgIGaD27McWG7Fa9zko/edit?usp=sharing)

## 設計書

- [詳細設計](https://docs.google.com/spreadsheets/d/1Q4QGkHVi_rTjECZibxzqX1ANj64N9cB5vMbBc902nXo/edit?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1Wqgv6TsoCbC6-1zsGjr4TC7mePVoNGAMwegTYexkgRU/edit?usp=sharing)
- [画面遷移図（会員側）](https://drive.google.com/file/d/1cntnq6TWV2JGSQM3j8vqJU17W9u4n_hE/view?usp=sharing)
- [画面遷移図（管理者側）](https://drive.google.com/file/d/1jDlOdGwtjkBSSkW3d4gw9n94RuC6GJs2/view?usp=sharing)
- [ER図](https://drive.google.com/file/d/1eYxr3_gzCQNhKfR1olpaYK5sNBvSpSLR/view?usp=sharing)
![omiyaget-ER](https://user-images.githubusercontent.com/108504337/204808810-1ba8aafa-870f-46cc-8600-6e8735c360c0.jpg)

## テスト
 - テスト仕様書にて実施:
[テスト仕様書](https://docs.google.com/spreadsheets/d/15Z0zs5bFW8DGClkPzh1XOWaPQMWmd945mo2kQmGu-xw/edit?usp=sharing)

## 開発環境
- OS：Linux(Amazon Linux 2)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材等外部リンク
- 写真:
  [photoAC](https://www.photo-ac.com/).
  [Pixabay](https://pixabay.com/ja/).

- アイコン:
  [Font Awesome](https://fontawesome.com/).
  [ICOOON MONO](https://icooon-mono.com/).
  [カクレノ](https://kotonohaworks.com/free-icons/).

- フォント:
  [Google Fonts](https://fonts.google.com/).

- グラデーション:
  [WebGradients](https://webgradients.com/).

- ロゴ制作:
  [designevo](https://www.designevo.com/).

- GoogleマップAPIの取得:
  [google cloud platform](https://cloud.google.com/).


