# AGENTS.md

## 目的
このフォルダ配下で作業するエージェントの共通基盤ルールを定義する。
各プロジェクトの `AGENTS.md` には、ここからの差分だけを書く。

## 適用範囲
- この `AGENTS.md` は、このフォルダ配下のデフォルトルールとして適用する。
- より近い階層の `AGENTS.md` / `AGENTS.override.md` がある場合は、そちらを優先する。

## 作業方針
- 基本フローは「調査 -> 最小変更 -> 検証 -> 説明」
- 不明点がある場合は推測で進めず、状況を共有して確認する
- 変更は小さく、1つの意図に絞る
- 変更前後の差分と理由を説明する
- "動く" を確認するまで終わりにしない（テスト or 最低限の実行確認）

## Git管理下での初期確認
Gitリポジトリで作業する場合のみ、着手時に以下を確認する。
- `git status`
- `git diff`
- `git log -n 20`

## 安全ガードレール
- `.env` や秘密情報（認証情報、トークン、鍵など）は編集しない
- デプロイ/インフラ設定は、明示的な依頼がある場合のみ変更する
- ユーザーが明記していない破壊的操作は実行しない
- ログや出力で機密情報を露出しない

## コマンド実行ポリシー

### Auto-allow（確認なしで実行OK: 読み取り・軽量確認）
- PowerShell: `Get-ChildItem`, `Get-Content`, `Select-String`, `Test-Path`, `Resolve-Path`
- Git: `git status`, `git diff`, `git log`, `git show`
- Node: `node -v`, `npm -v`, `pnpm -v`（バージョン確認のみ）
- 検証系: `npm run test`, `npm run lint`, `npm run typecheck`, `pnpm run test`, `pnpm run lint`, `pnpm run typecheck`

### Ask（実行前に必ず確認: 変更や重い実行を伴う可能性）
- Git: `git checkout`, `git switch`, `git restore`, `git commit`
- Node: `npm install`, `pnpm install`
- Node: 上記の検証系以外の `npm run *`, `pnpm run *`
- PowerShell: 書き込みを伴う可能性があるもの全般（`Out-File`, `>` `>>` を含む）
- "時間がかかる/出力が大量" になりそうなもの（例: 大規模な再帰探索）
- ネットワークアクセスが絡むコマンド

### Deny（原則禁止: 破壊的・危険）
- PowerShell: `Remove-Item`, `Move-Item`, `Rename-Item`, `Set-Content`, `Add-Content`, `Set-ItemProperty`
- Git: `git reset --hard`, `git clean -fdx`, `git push -f`
- 外部取得して即実行するもの: `curl | sh`, `irm | iex`, `Invoke-Expression` など
- ただし、ユーザーが実行コマンドを明記して依頼した場合のみ実行可

## AGENTS / Skill 設計方針
- このルート `AGENTS.md` には「必須ルール・禁止事項・承認条件」のみを置く
- 各プロジェクト `AGENTS.md` には次の差分のみを置く
  - プロジェクト固有コマンド
  - 例外ルール
  - Skill の起動条件（いつ使うか）
- 手順詳細は `skills/<name>/SKILL.md` または `.cursor/skills/<name>/SKILL.md` に分離する
- `AGENTS.md` は原則 300 行以内に保つ。超える見込みなら Skill に分割する

## プロジェクトAGENTSの最小テンプレート
- 目的（共通基盤を継承し差分だけ書くこと）
- 適用範囲
- プロジェクト固有運用（必要最小限）
- プロジェクトコマンド
- Skill運用（一覧の場所と更新ルール）
- 更新日

## 変更時チェックリスト
- [ ] 変更の目的が1文で言える
- [ ] 影響範囲（触ったファイル/機能）を列挙した
- [ ] 検証（テスト or 動作確認）をした
- [ ] リスク/代替案があれば書いた

## ルール優先順位
1. 最も近い `AGENTS.override.md`
2. 最も近い `AGENTS.md`
3. このルート `AGENTS.md`

## 更新
- Last updated: 2026-02-06
