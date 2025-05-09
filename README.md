<div align="center">

# Zerg project

Play Starcraft in Dagger (or Docker) 🐙

</div>

## Prerequisites

- Running on Linux (unfortunately, Windows and MacOS is not supported because of nested virtualization)
- Docker/Dagger
- KVM/VT-x enabled
- A starcraft.iso
- A windows iso

Because of legacy reasons, we won't be giving hint on how to get a starcraft.iso and a windows iso. As of us, we own a Windows XP and a Starcraft game.

## Usage

First clone the repository.

### With dagger

```bash
cd zerg-project
dagger call play --windows-iso=windows.iso --starcraft-iso=starcraft.iso up
```

### With Docker

```
cd docker
docker compose up --build
```

## ONCE YOUR IN

1. Visit [http://localhost:8006/](http://localhost:8006/)
2. Install Windows XP then shutdown the computer
3. Starcraft qemu will start automatically and you will be able to see the mounted cdrom
4. You can now play the game
