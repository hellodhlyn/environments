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
  current_branch=$(git branch --show-current)
  if [[ $current_branch == "main" ]]; then
    return
  fi

  git switch main && \
    git merge --no-ff $current_branch && \
    git push origin main && \
    git branch -d $current_branch
}

function gitlog() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit --all
}

