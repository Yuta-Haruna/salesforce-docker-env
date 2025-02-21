<!-- 取扱い説明書 -->

利用方法：
<!-- 代表一名のみ実施すればOK -->
①実装した環境に、新規リポジトリを作成(Privateも可能)
②上記リポジトリに下記のファイル構成を作成


<!-- ここから各開発者のリポジトリに配置して使用する場合の手順 -->

③


個人アカウント用
https://github.com/users/<GitHubユーザー名>/packages/container/salesforce-cli


組織用
https://github.com/orgs/<Organization名>/packages/container/salesforce-cli



<!-- 備忘録 -->
仕組みについての解説：

利用機能
GitHubAction

仕組み(流れ)：
update-docker.yml
　ここでDockerイメージを定期実行するバッチを管理
　　　→最新のCLIバージョンを取得してから操作を実行する。
　　　→最新バージョンと既存のバージョンタグが違う場合は、最新イメージをghcr環境にPUSHする。
　　　※最新イメージはDockerFile記載の内容をベースに作成

目的：
GitHubActionには課金体系が存在するため、コストカットするために不要な更新はさせないようする。



