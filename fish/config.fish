# opencode
if test -d "$HOME/.opencode/bin"
    fish_add_path "$HOME/.opencode/bin"
end

# railway
if test -d "$HOME/.railway/bin"
    fish_add_path "$HOME/.railway/bin"
end

# editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# mise
mise activate fish | source

# zoxide
if type -q zoxide
    zoxide init fish --cmd cd | source
end

# starship
if type -q starship
    starship init fish | source
end

# eza alias
if type -q eza
    alias ls='eza --icons --grid --group-directories-first'
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if test -d "$PNPM_HOME"
    fish_add_path "$PNPM_HOME"
end

# railway env
if test -f "$HOME/.railway/env.fish"
    source "$HOME/.railway/env.fish"
end

# atuin env
if test -f "$HOME/.atuin/bin/env.fish"
    source "$HOME/.atuin/bin/env.fish"
end

# Keep mise's activated tool paths authoritative; inherited shims would make
# diagnostics report the same managed executable more than once.
set -gx PATH (string match -v -- "$HOME/.local/share/mise/shims" $PATH)

# Added by Antigravity CLI installer
fish_add_path "$HOME/.local/bin"
