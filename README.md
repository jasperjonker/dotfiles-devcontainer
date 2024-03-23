# Dotfiles for devcontainers

This repository contains dotfiles that can be used in devcontainers. This can be useful in vscode.

## Configuration

Add the settings below in the folder `.vscode/settings.json`:

```json
{
  "remote.containers.dotfiles.repository": "git@github.com:jasperjonker/dotfiles-devcontainer.git",
  "remote.containers.dotfiles.installCommand": "~/dotfiles/install.sh",
  "remote.containers.dotfiles.targetPath": "~/dotfiles",
}
```
