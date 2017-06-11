# Choice

## Setup

### 環境変数

#### BOT_TOKEN
slackでbotsに登録した時に手に入るトークン。

#### BOT_ID
botユーザのID。@は含まない。

## Usage

### init
グループを作成する。
メンバーの順番はシャッフルされる。

```
@choice init グループ名 Aさん [Bさん...]
```

### choice
指定したグループのメンバー内から指定人数を選出する。

```
@choice choice グループ名 [数値]
```

### add
指定したグループにメンバーを追加する。

```
@choice add グループ名 Aさん [Bさん...]
```

### remove
指定したグループから指定メンバーを削除する。

```
@choice remove グループ名 Aさん [Bさん...]
```

メンバーを指定しない場合はグループを削除する。

```
@choice remove グループ名
```

### copy
グループAのメンバーをグループBにコピーする。

```
@choice copy グループA グループB
```

### swap
AさんとBさんの位置を入れ替える。

```
@choice swap グループ名 Aさん Bさん
```

### shuffle
メンバーの順番をシャッフルする。

```
@choice shuffle グループ名
```

### list
登録されているグループの一覧をだす。

```
@choice list
```

### show
グループの情報をだす。

```
@choice show グループ名
```
