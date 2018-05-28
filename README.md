# Elixir on Docker

Elixir + PhoenixをDockerで使うためのリポジトリ

# 使い方

まずはイメージをビルド

```sh
docker-compose build
```

プロジェクトを作成する

```sh
docker-compose run app /bin/bash -l "mix phx.new . --app <app_name> --database mysql"
```

データベースの定義を変更する。
作成されたプロジェクトフォルダ内の、

+ config/dev.exs
+ config/prod.secret.exs

に定義が書かれているので修正する。

```yaml
# Configure your database
config :phoenix_sample, PhoenixSample.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "mariadb",
  password: "p@ssw0rd",
  database: "phoenixdb",
  hostname: "mariadb",
  port: 3306,
  pool_size: 10
```

（検証時点ならprod.secret.exsの編集は不要。）

データベースのセットアップ

```sh
docker-compose run app mix ecto.create
```

以下のコマンドでアプリを起動

```sh
docker-compose up
```

