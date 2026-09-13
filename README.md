# Personal configuration snapshots

This repository stores independent, declarative snapshots of selected personal configuration. Files are copied into this clone; they are not symlinks to the live configuration.

## Source mappings

| Snapshot path | Source path |
| --- | --- |
| `fish/config.fish` | `~/.config/fish/config.fish` |
| `fish/conf.d/{atuin.env.fish,uv.env.fish}` | `~/.config/fish/conf.d/` |
| `ghostty/config` | `~/.config/ghostty/config` |
| `herdr/config.toml` | `~/.config/herdr/config.toml` |
| `claude/` | `~/.claude/` selected settings, hook, output style, and themes |
| `pi/` | `~/.pi/agent/` selected settings, MCP config, extension, and theme |

## Exclusions

The snapshot excludes credentials and local trust state, runtime/session data, logs, sockets, caches, backups, installed plugin/package inventories, and generated Gentle AI artifacts. Claude and Pi settings are sanitized to remove Gentle AI-specific references; Claude's generated `autoMode` environment block and Pi's generated changelog version are also omitted.
