#!/bin/bash
# Detect team pack folders in the current working directory
# Runs on SessionStart to notify user of available team packs

TEAM_PACKS_DIR="./team-packs"
TEAM_YAML="team.yaml"

found_packs=()

# Check for team-packs/ directory in cwd
if [ -d "$TEAM_PACKS_DIR" ]; then
  for dir in "$TEAM_PACKS_DIR"/*/; do
    if [ -f "${dir}${TEAM_YAML}" ]; then
      pack_name=$(basename "$dir")
      found_packs+=("$pack_name")
    fi
  done
fi

# Check if cwd itself is a team pack
if [ -f "./${TEAM_YAML}" ]; then
  found_packs+=("(current directory)")
fi

# Output notification if packs found
if [ ${#found_packs[@]} -gt 0 ]; then
  echo "Team packs found: ${found_packs[*]}"
  echo "Load with: /team-load <name>"
fi
