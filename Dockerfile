## Salesforce CLI の最新イメージを使用
FROM salesforce/cli:latest-full

## 作業ディレクトリを設定
WORKDIR /workspace

## 環境変数（必要なら追加）
# Apex テストのコードカバー率がこの設定以上の場合、緑で表示されます
ENV SF_CODE_COVERAGE_REQUIREMENT=75
# CLI の自動更新機能を無効にする場合、true に設定します。
ENV SF_DISABLE_AUTOUPDATE=true
ENV SF_AUTOUPDATE_DISABLE=true

## コンテナ内とローカルの権限を統一
RUN mkdir -p /workspace && chown 1000:1000 /workspace

## デフォルトのシェル
CMD [ "sleep", "infinity" ]


