#!/usr/bin/env bash

function gitrb() {
  current_branch=$(git branch --show-current)
  if [[ $current_branch == "main" ]]; then
    return
  fi

  git switch main && \
    git pull && \
    git switch $current_branch && \
    git rebase main
}

function gitmg() {
  current_branch="$(git branch --show-current)"
  if [[ "$current_branch" == "main" ]]; then
    return
  fi

  pull_request="$(gh pr view --json number,title)"
  pr_number="$(echo $pull_request | jq -r .number)"
  pr_title="$(echo $pull_request | jq -r .title)"

  git switch main && \
    git merge --no-ff $current_branch -m "Merge #$pr_number: $pr_title" && \
    git push origin main && \
    git branch -d $current_branch
}

function gitlog() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit --all
}
