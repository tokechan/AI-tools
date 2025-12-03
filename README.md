# Altools - AI Tools Configuration Repository

このリポジトリは、複数のAI CLIツールの設定を一元管理するためのものです。

## 📦 含まれるツール

### 1. [Codex CLI](./codex-config/)
OpenAI Codex CLIのグローバル設定

- `AGENTS.md` - グローバルルール設定
- セットアップスクリプト (Mac/Linux/Windows対応)

**詳細:** [codex-config/README.md](./codex-config/README.md)

---

## 📁 フォルダ構造

```
Altools/
├── codex-config/          # Codex CLI設定
│   ├── AGENTS.md
│   ├── setup.sh
│   ├── setup.ps1
│   └── README.md
├── cursor-rules/          # (今後追加予定)
├── copilot-settings/      # (今後追加予定)
└── README.md              # このファイル
```

## 🚀 使い方

各ツールのフォルダに移動して、そこにあるREADME.mdを参照してください。

### 全体のセットアップ（Mac/Linux）

```bash
# リポジトリをクローン
git clone https://github.com/YOUR_USERNAME/Altools.git
cd Altools

# Codex CLI設定をセットアップ
cd codex-config
chmod +x setup.sh
./setup.sh
```

### 全体のセットアップ（Windows）

```powershell
# リポジトリをクローン
git clone https://github.com/YOUR_USERNAME/Altools.git
cd Altools

# Codex CLI設定をセットアップ
cd codex-config
.\setup.ps1
```

## ⚠️ セキュリティ上の注意

このリポジトリには**設定テンプレートのみ**を含めてください。

### ❌ 含めてはいけないもの
- APIキー (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY` など)
- 認証トークン (`auth.json`, `token.json` など)
- セッション情報、履歴ファイル
- 個人的なパス情報を含む設定ファイル

### ✅ 含めて良いもの
- グローバルルール設定 (`AGENTS.md`, `.cursorrules` など)
- 設定ファイルのテンプレート（機密情報を除いたもの）
- セットアップスクリプト
- ドキュメント

## 🔧 新しいツールを追加する場合

1. 新しいフォルダを作成（例: `cursor-rules/`）
2. 設定ファイルとREADME.mdを追加
3. 必要に応じてセットアップスクリプトを作成
4. このREADME.mdに追加したツールの情報を記載
5. `.gitignore`に機密情報のパターンを追加

## 📝 更新方法

### Mac/Linuxの場合
```bash
# 設定を更新
cd ~/Develop/Altools
git pull

# 各ツールのセットアップスクリプトを再実行
cd codex-config && ./setup.sh
```

### Windowsの場合
```powershell
# 設定を更新
cd ~/Develop/Altools
git pull

# 各ツールのセットアップスクリプトを再実行
cd codex-config
.\setup.ps1
```

---

**Maintained by Yuta Tokeshi**  
_Last updated: 2025-12-03_

