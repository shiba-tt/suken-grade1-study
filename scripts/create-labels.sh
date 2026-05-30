#!/usr/bin/env bash
set -euo pipefail

# GitHub CLI が認証済みの状態で、リポジトリルートから実行してください。
# 既存ラベルがある場合は色・説明を更新します。

create_or_update_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if gh label list --search "$name" --json name --jq '.[].name' | grep -Fxq "$name"; then
    gh label edit "$name" --color "$color" --description "$description"
  else
    gh label create "$name" --color "$color" --description "$description"
  fi
}

create_or_update_label "area:解析" "1f77b4" "微積分、多変数解析、微分方程式など"
create_or_update_label "area:線形代数" "17becf" "行列、ベクトル空間、固有値、二次形式など"
create_or_update_label "area:複素解析" "9467bd" "正則性、複素積分、留数など"
create_or_update_label "area:確率統計" "2ca02c" "確率、期待値、分散、分布、統計など"
create_or_update_label "area:整数論" "8c564b" "合同式、互除法、整数問題など"
create_or_update_label "area:数値解析" "e377c2" "近似計算、数値解法など"
create_or_update_label "area:コンピュータ" "7f7f7f" "アルゴリズム、計算量など"
create_or_update_label "area:過去問" "ff7f0e" "過去問演習・復習・分析"

create_or_update_label "type:弱点" "d62728" "苦手分野や再発するミス"
create_or_update_label "type:復習" "ffbb78" "再演習・復習タスク"
create_or_update_label "type:過去問" "ff9896" "過去問に関する課題"
create_or_update_label "type:教材" "c5b0d5" "教材選定・教材進行に関する課題"
create_or_update_label "type:計算ミス" "f7b6d2" "計算ミス対策"
create_or_update_label "type:計画修正" "bcbd22" "学習計画の見直し"

create_or_update_label "priority:high" "b60205" "直近で得点に大きく影響する課題"
create_or_update_label "priority:medium" "fbca04" "通常の復習・改善課題"
create_or_update_label "priority:low" "0e8a16" "余力があるときに扱う課題"

create_or_update_label "status:要復習" "d93f0b" "復習内容が未着手の課題"
create_or_update_label "status:再演習待ち" "0052cc" "一度対策し、再演習を待っている課題"
create_or_update_label "status:完了" "5319e7" "完了済みの課題"
