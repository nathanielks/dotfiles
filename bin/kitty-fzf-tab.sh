#!/usr/bin/env zsh

export PATH="/opt/homebrew/bin:$PATH"

jq=$(which jq)
fzf=$(which fzf)

all_tabs="$(
    kitty @ ls | $jq -r '
        .[]
        | select(.is_active)
        | .tabs[]
        | select(.is_focused == false)
        | [.title, "id:\(.id)"]
        | @tsv
    ' | column -ts $'\t'
)"
new_tab_id="$($fzf --reverse <<< "${all_tabs}" | awk '{ print $NF }')"
kitty @ focus-tab -m "${new_tab_id}"
