#!/bin/sh
# Agent tooling creates branches with a vendor prefix and a random hex suffix;
# branch names are the feature name alone.
set -eu

branch=$(git branch --show-current 2>/dev/null) || exit 0
[ -n "$branch" ] || exit 0

name=${branch#claude/}
name=${name#codex/}

suffix=${name##*-}
if [ ${#suffix} -eq 6 ] && printf '%s' "$suffix" | grep -qE '^[0-9a-f]*[0-9][0-9a-f]*$'; then
    name=${name%-*}
fi

[ "$name" != "$branch" ] || exit 0
git branch -m "$name" 2>/dev/null || exit 0
printf '{"systemMessage":"renamed branch %s to %s"}' "$branch" "$name"
