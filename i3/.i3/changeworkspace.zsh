#!/bin/zsh
i3_next_workspace() {
    local wss="$(i3-msg -t get_workspaces)"
    local curws="$(echo $wss | jq 'map(select(.focused)) | .[0]')"
    local curnum="$(echo $curws | jq '.num')"
    local curout="$(echo $curws | jq '.output')"
    local next=1
    if [[  curnum -lt 10 ]]; then
        (( next = $curnum + 1))
    fi
    if [[ $1 =~ move ]]; then
       i3-msg -t command move container to workspace $next
    fi
    # local com="map(select(.num == $next)) | .[0] | .output"
    # local nextout="$( echo $wss | jq $com )"
    # if  [[ ! $nextout =~ null ]] && [[ ! $curout  =~ $nextout ]]; then
    #     i3-msg -t command output right
    #     i3-msg -t command move workspace to output $curout
    #     i3-msg -t command output $curout
    #     i3-msg -t command move workspace to output $nextout
    # fi
    if [[ ! $2 =~ nogo ]]; then
        i3-msg -t command workspace $next
    fi

}

i3_prev_workspace() {
    local wss="$(i3-msg -t get_workspaces)"
    local curws="$(echo $wss | jq 'map(select(.focused)) | .[0]')"
    local curnum="$(echo $curws | jq '.num')"
    local curout="$(echo $curws | jq '.output')"
    local prev=10
    if [[ curnum -gt 1 ]]; then
        (( prev = $curnum - 1))
    fi
    if [[ $1 =~ move ]]; then
        i3-msg -t command move container to workspace $prev
    fi
    # local com="map(select(.num == $prev)) | .[0] | .output"
    # local prevout="$( echo $wss | jq $com )"
    # if  [[ ! $prevout =~ null ]] && [[ ! $curout  =~ $prevout ]]; then
    #     i3-msg -t command workspace $prev
    #     i3-msg -t command move workspace to output $curout
    #     i3-msg -t command workspace $curnum
    #     i3-msg -t command move workspace to output $prevout
    # fi
    #
    if [[ ! $2 =~ nogo ]]; then
        i3-msg -t command workspace $prev
    fi
}
i3_$1_workspace $2 $3
