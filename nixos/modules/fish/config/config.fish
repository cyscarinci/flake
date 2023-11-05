set fish_greeting

alias research "zellij --layout ~/.config/zellij/research_layout.kdl"
alias teaching "zellij --layout ~/.config/zellij/teaching_layout.kdl"
alias config "zellij --layout ~/.config/zellij/config_layout.kdl"
alias research "zellij --layout ~/.config/zellij/research_layout.kdl"
alias nixos_update "sudo nixos-rebuild switch --flake ~/.dotfiles/#" 
alias hm_update "home-manager switch --flake ~/.dotfiles/#user"
alias flake_update "sudo nix flake update"
alias .. "cd .."
alias ... "cd ../.."
alias q "exit"
alias cat "bat"
alias ls "lsd"
alias l "ls -l"
alias la "ls -a"
alias lla "ls -la"
alias gst "git status"
alias ga "git add"
alias gcm "git commit"
alias gcl "git clone"
alias gph "git push"
alias gpl "git pull"
alias gco "git checkout"


alias ansible-shell "nix-shell -p 'python310.withPackages(ps : with ps; [ pip resolvelib pyyaml pycparser packaging markupsafe jinja2 cffi cryptography ansible-core ansible passlib ])'"

# colorscript random

# starship init fish | source
