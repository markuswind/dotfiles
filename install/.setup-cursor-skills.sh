#!/bin/bash

# Installs or updates Cursor CLI skills stored in ~/dotfiles/.agents/skills/.
# Skills are installed via `npx skills` into the dotfiles repo, then symlinked
# into ~/.cursor/skills-cursor/ so Cursor CLI can discover them.
#
# Usage:
#   bash .setup-cursor-skills.sh          # install or update all skills
#
# To add a new skill, append it to the skills array below in the format:
#   "gh-org/repo -a cursor"

dir=~/dotfiles
agents_skills_dir=$dir/.agents/skills
cursor_skills_dir=~/.cursor/skills-cursor

skills=(
  "JuliusBrussee/caveman -a cursor"
)

mkdir -p "$agents_skills_dir"
mkdir -p "$cursor_skills_dir"

for skill_spec in "${skills[@]}"; do
  repo=$(echo "$skill_spec" | awk '{print $1}')

  if [ -d "$agents_skills_dir/${repo##*/}" ]; then
    echo "Updating skills from: $repo"
    npx skills update $skill_spec
  else
    echo "Installing skills from: $repo"
    npx skills add $skill_spec
  fi
done

echo "Symlinking skills into ~/.cursor/skills-cursor/"
for skill_dir in "$agents_skills_dir"/*/; do
  skill_name=$(basename "$skill_dir")
  ln -sfn "$skill_dir" "$cursor_skills_dir/$skill_name"
  echo "  -> $skill_name"
done
