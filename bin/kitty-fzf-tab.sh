#!/usr/bin/env zsh

all_tabs="$(
    kitty @ ls | /opt/homebrew/bin/jq -r '
        .[]
        | select(.is_active)
        | .tabs[]
        | select(.is_focused == false)
        | [.title, "id:\(.id)"]
        | @tsv
    ' | column -ts $'\t'
)"

new_tab_id="$(/opt/homebrew/bin/fzf --reverse <<< "${all_tabs}" | awk '{ print $NF }')"
kitty @ focus-tab -m "${new_tab_id}"
