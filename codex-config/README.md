# Codex CLI Configuration Template

このリポジトリは、複数のマシン間で**Codex CLIの設定を共有**するためのテンプレートです。

## 📁 含まれるファイル

- `AGENTS.md` - Codex CLIのグローバルルール設定
- `setup.sh` - Mac/Linux用セットアップスクリプト
- `setup.ps1` - Windows用セットアップスクリプト

## 🚀 セットアップ

### Mac / Linux

```bash
# リポジトリをクローン
git clone https://github.com/YOUR_USERNAME/codex-config-template.git
cd codex-config-template

# セットアップスクリプトを実行
chmod +x setup.sh
./setup.sh
```

または手動でコピー：

```bash
cp AGENTS.md ~/.codex/AGENTS.md
```

### Windows (PowerShell)

```powershell
# リポジトリをクローン
git clone https://github.com/YOUR_USERNAME/codex-config-template.git
cd codex-config-template

# セットアップスクリプトを実行
.\setup.ps1
```

または手動でコピー：

```powershell
Copy-Item AGENTS.md $env:USERPROFILE\.codex\AGENTS.md
```

## 📝 設定の更新

設定を更新した場合は、このリポジトリにコミット＆プッシュしてください：

```bash
# Mac/Linuxの場合
cp ~/.codex/AGENTS.md ./AGENTS.md
git add AGENTS.md
git commit -m "update: AGENTS.md configuration"
git push
```

## ⚠️ 注意事項

このリポジトリには**機密情報を含めないでください**：

- ❌ `auth.json` - OpenAI認証トークン
- ❌ `history.jsonl` - コマンド履歴
- ❌ `sessions/` - セッション情報
- ❌ `config.toml` - 個人的なパス情報を含む設定

これらは各マシンで自動生成されるため、共有する必要はありません。

## 📦 含まれるべきファイル

- ✅ `AGENTS.md` - グローバルルール
- ✅ README、セットアップスクリプトなどのドキュメント

---

**Maintained by Yuta Tokeshi**  
_Last updated: 2025-12-03_

