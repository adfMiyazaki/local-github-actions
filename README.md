# 概要

Docker(Windows)で立ち上げたUbuntu内でGitHub Actionsをローカルで動かすことができる`act`を実行する。
`act`の実行にはDockerが必要なので、Ubuntu内にDockerをインストールしている。

以下を参照した。
https://qiita.com/nijigen_plot/items/7f7eb67b254d7b4d58e8

## 前提

Windowsマシン上にDocker Desktopがインストールされていること。


## 使い方

`create-start.bat`を実行するとDockerイメージの作成が始まる。
結構時間がかかるので辛抱強く待つ。

終わったら`into-container.bat`を実行してコンテナ内にbashでログインする。

### GitHub Actionsのローカル実行手順

1. `./workspace`をコンテナ内の`/workspace`と共有しているので、`./workspace`フォルダにプロジェクトを配置。
   （コンテナ内でgit cloneしてもよい）
2. コンテナ内でプロジェクトディレクトリに移動する。
3. `act -l`を実行して、実行可能なジョブの一覧が出ることを確認する。
   `.github/workflows/`にGitHub Actionsを定義したymlファイルが無いとエラーになる。
4. `act -j <ジョブID> -W .github/workflows/<テンプレートファイル>.yml`を実行する。


## .batファイルについて

.bat ファイルでコンテナの起動停止などができるようにしている。

- create-start.bat ... コンテナの構築と起動
- delete-container.bat ... コンテナを停止して削除
- into-container.bat ... 起動中のコンテナにbashでログイン
- start.bat ... 構築済みのコンテナを起動
- stop.bat ... 起動済みのコンテナを停止
