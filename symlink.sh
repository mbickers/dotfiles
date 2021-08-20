#!/usr/bin/env bash
set -euo pipefail

# Parse arguments
usage="Usage: $(basename "$0") [--remove|--force|--help]"

if [[ $# -eq 0 ]]; then
    force=0
    remove=0
elif [[ $# -eq 1 ]]; then
    case "$1" in
        --remove | -r)
            force=0
            remove=1
            ;;
        --force | -f)
            force=1
            remove=0
            ;;
        --help | -h)
            echo "$usage"
            exit 0
            ;;
        *)
            echo "$usage"
            exit 1
            ;;
    esac
else
    echo "$usage"
    exit 1
fi

# Register symlinks (source files relative to the directory of this script)
links=(
    # Setup nvim
    "vim/init.vim:~/.config/nvim/init.vim"
    "vim/nord2.vim:~/.config/nvim/autoload/airline/themes/nord2.vim"
    # Setup tmux
    "tmux/tmux.conf:~/.tmux.conf"
    # Setup git
    "git/gitconfig:~/.gitconfig"
    "git/gitigonore:~/.gitignore"
    # Setup zsh
    "zsh/hushlogin:~/.hushlogin"
    "zsh/zshrc:~/.zshrc")

# Remove symlinks
if [[ $remove -eq 1 ]]; then
    for entry in "${links[@]}"; do
        link_name="${entry#*:}"
        expanded_link_name="${link_name/#\~/$HOME}"
        if [[ -L $expanded_link_name ]]; then
            rm "$expanded_link_name"
        else
            echo "$link_name is not a symbolic link, will not remove."
        fi
    done

    exit 0
fi

# Add symlinks
if [[ $force -eq 0 ]]; then
    would_overwrite=()
    for entry in "${links[@]}"; do
        link_name="${entry#*:}"
        expanded_link_name="${link_name/#\~/$HOME}"
        if [[ -e $expanded_link_name && ! -L $expanded_link_name ]]; then
            would_overwrite+=("$link_name")
        fi
    done

    if [[ ${#would_overwrite[@]} -ne 0 ]]; then
        echo "The following files or directories aleady exist:"
        for name in "${would_overwrite[@]}"; do
            printf "\t%s\n" "$name"
        done
        echo "Rerun with --force to overwrite."
        exit 1
    fi
fi

repo_root="$(cd "$(dirname "$0")" && pwd)"
for entry in "${links[@]}"; do
    source_file="${entry%%:*}"
    expanded_source_file="$repo_root/$source_file"
    link_name="${entry#*:}"
    expanded_link_name="${link_name/#\~/$HOME}"
    if [[ -e $expanded_link_name ]]; then
        rm -r "$expanded_link_name"
    fi
    mkdir -p "$(dirname "$expanded_link_name")"
    ln -s "$expanded_source_file" "$expanded_link_name"
done
