# Code Reading Escape (Rails)

「AIコードリーディング × 脱出ゲーム」イベントの題材アプリです。
参加者はこのリポジトリを **cloneせず、GitHub上でコードを読むだけ** で謎を解けるように設計されています。

## セットアップ(Docker)

```bash
docker compose up --build
```

起動後、以下のページが確認できます。

- `http://localhost:3300/posts/post-a` — ステージ1・2で使う `show` アクション
- `http://localhost:3300/posts/post-c/digest` — ステージ3の `digest` アクション(意図的にバグがあります)
- `http://localhost:3300/answer` — 最終問題の回答フォーム

初回起動時に `bin/rails db:prepare` が自動実行され、マイグレーション適用と `db/seeds.rb` の投入が行われます。

## ディレクトリの見どころ

| ファイル | 使うステージ |
|---|---|
| `db/seeds.rb` | 全ステージ共通(対象データの特定) |
| `config/routes.rb` | 全ステージ(アクションの入り口を探る) |
| `app/controllers/posts_controller.rb` | ステージ1・3 |
| `config/locales/en.yml` | ステージ1 |
| `app/models/comment.rb` | ステージ2 |
| `app/models/post.rb` | ステージ3(`display_title` にタイポあり) |
| `app/controllers/answers_controller.rb` | 最終問題の正誤判定 |

## 表示言語について

見出し・ラベル・ボタン・フラッシュメッセージなど画面まわりのUIは日本語にしています。
ただし以下は**謎解きの答えそのもの**なので、あえて英語のまま残しています(日本語化すると謎が成立しなくなります)。

- `config/locales/en.yml` のメッセージ(ステージ1)
- `app/models/comment.rb` のバリデーションエラー文(ステージ2)
- `app/models/post.rb` `display_title` の返り値(ステージ3)

## 補足

- Bootstrap 5 はCDN経由で読み込んでおり、アセットパイプライン(Sprockets/importmap)の設定は省いています。
- 開発用に `SECRET_KEY_BASE` を直接環境変数で渡しています(本番運用は想定していません)。
- Ruby/Railsのバージョンは `Gemfile` にあるとおり Ruby 3.3 / Rails 7.1 系を想定していますが、参加者向けの謎解きには直接関係しません。

23:57  編集済み
23:54 編集済み
