if status is-interactive
    zoxide init fish | source
end

function v
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end

function search_projects_goto
    if test $templafy
        set search_path ~/projects/Templafy/
    else
        set search_path ~/projects/
    end

    set selected (fd --type d --min-depth 1 --max-depth 3 --exclude .git --search-path $search_path -u | fzf --reverse --height=50% --reverse --info=inline)

    if test -z "$selected"
        echo "Nothing was selected."
        return
    end

    z $selected
    commandline -f repaint

end
bind \ce search_projects_goto

set PATH $PATH /home/andrius/.local/bin
set PATH $PATH /Users/andrius/.local/bin
