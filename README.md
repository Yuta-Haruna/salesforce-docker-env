<!-- 取扱い説明書 -->

利用方法：
<!-- 代表一名のみ実施すればOK -->
初回SF環境実行者(プロジェクトがまだないとき)：
①好きな場所にプロジェクトフォルダを作成(プロジェクト名は、半角英数字のみ)
②上記リポジトリに下記のファイル構成を作成
　プロジェクト名
　　↳Dockerファイル

③上記の配置が完了したら、コマンドパレットから下記コマンドを実行する

　※選択するフォルダは、プロジェクト名とする。



<!-- ここから各開発者のリポジトリに配置して使用する場合の手順 -->
既にGitHubにソースが存在する場合のやり方：
①GitHubからソースをクローンする。
②コマンドパレットから下記コマンドを実行する


　※選択するフォルダは、プロジェクト名とする。

③完了



個人アカウント用
https://github.com/users/<GitHubユーザー名>/packages/container/salesforce-cli


組織用
https://github.com/orgs/<Organization名>/packages/container/salesforce-cli



<!-- 備忘録 -->
## 仕組みについての解説：

### 利用機能：
![Static Badge](https://img.shields.io/badge/Docker-blue)
</br>
![Static Badge](https://img.shields.io/badge/GitHub%20Action-blue)


### 仕組み(流れ)：
1. GitHub Actionで毎月自動でSalesforceCLIの最新イメージを作成し、パッケージ化する

2. 各開発ユーザは、ローカル環境に環境を構築する
  * 掲載しているDockerFileを使用したリポジトリが存在する場合は、クローン
  * 新規でプロジェクトを作成する場合は、下記ファイルを下記階層で作成する

#### ディレクトリ構成(新規作成パターン)
.
└── salesforce-docker-env/
    ├── .devcontainer/
    │   └── devcontainer.json

3. VSCODEからコンテナ起動を実行
　→内部でdevcontainer.jsonとDockerFileから、環境のビルドを実施。
　　→devcontainer.jsonの設定で、既存プロジェクトがない場合は、Salesforceプロジェクトを作成する。

4. 開発環境の構築完了
　※好きな拡張機能あれば、随時設定ください。


## その他

### ディレクトリ構成
.
└── salesforce-docker-env/
    ├── .devcontainer/
    │   └── devcontainer.json       #開発者向けのツール設定、開発環境の構築(VSCODEで使うため)
    ├── .github/
    │   └── workflows/
    │       └── update-docker.yml   #GitHubアクションの実行ファイル(バッチソース)
    ├── docker-compose.yml          #複数のサービス（DB、API、フロントなど）の起動・連携
    ├── Dockerfile                  #コンテナの中身（OS、ライブラリ等）の詳細な設定
    └── README.md                   #使い方_今見ている場所


ファイル名　
update-docker.yml
　ここでDockerイメージを定期実行するバッチを管理
　　　→毎月最新イメージをghcr環境にPUSHする。
　　　※最新イメージはDockerFile記載の内容をベースに作成

### 工夫：
* GitHubActionには課金体系が存在するため、コストカットするために不要な更新はさせないようする。(月1回_実行)
* 初期設定者は、一度設定したらメンテナンス不要(SalesforceCLIの自動バージョンアップ)
* GitHub Actionの更新タイミングは午前4時にする(開発中の混乱を避けるため)
* 各エンド開発者は、手順に従い使用するだけで常に最新のSalesforce開発環境で開発可能(ユーザ毎のローカル環境差をなくすことができる。環境原因の不要な調査改善工数をなくす)
* 新規プロジェクトの場合、自動でSalesforceのcreateProjectコマンド(デフォルトテンプレート＆マニフェストファイル付き)を実行することで、初期設定を短縮(コマンドの階層問題も自動処理で解消)
* コンテナ実行時に、16個の推奨VSCODE拡張機能を設定する。(レビュー時間、開発時間の短縮)

