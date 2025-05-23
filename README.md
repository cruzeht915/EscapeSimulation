# Escape Simulation

**Escape Simulation** is a Roblox experience built using [Rojo](https://github.com/rojo-rbx/rojo) that simulates a dynamic escape room environment. Players must solve puzzles, interact with objects, and navigate obstacles to escape under time pressure. The project is designed with modularity and scalability in mind, leveraging strict-typed Luau, reusable component patterns, and clean folder-based architecture.

---

## Features

- **Interactive puzzles**: Touch-activated levers, switches, and logic gates
- **Hazards and functional blocks**: Lava floors, pass-through platforms, speed bocks
- **Multiplayer support**: Designed to support multiple players simultaneously
- **Modular code structure**: Organized using Rojo with strict type safety
- **Testable architecture**: Clean separation of logic, UI, and part behavior

---

## Folder Structure

```
escape-simulation/
├── default.project.json        # Rojo project file
├── src/
│   ├── Client/                 # Local scripts (UI, player input)
│   ├── Server/                 # Game logic (hazards, escape logic)
│   ├── Shared/                 # Type definitions, component bases
│   │   ├── parts/              # Reusable part classes (BaseBlock, LavaPart, etc.)
│   └── ReplicatedStorage/      # Shared assets and modules
```

---

## Setup Instructions

1. **Clone the repo**:
   ```bash
   git clone https://github.com/your-username/escape-simulation.git
   ```

2. **Install Rojo (if you haven’t)**:
   [https://rojo.space/docs](https://rojo.space/docs)

3. **Open the `.project.json` file in VSCode** with the Roblox LSP for type checking.

4. **Sync to Roblox Studio**:
   ```bash
   rojo serve
   ```
   Then in Studio, click `Start Server` in the Rojo plugin.

---

## Typing and Tooling

- `--!strict` mode enforced across all scripts
- Modular object system using metatables + structural type interfaces
- Base parts extend from `BaseBlock` via type-safe inheritance

---

## Example Part Types

- `BaseBlock`: Generic interactable block interface
- `LavaPart`: Damaging hazard with `ApplyEffect()`
- `SpeedBoostPart`: Grants temporary speed buff
- `ExitDoor`: Opens when all puzzles are solved

Each part implements a shared interface, enabling polymorphic escape logic.

---

## Future Features

- Countdown timer
- Leaderboard integration
- Procedural room generation
- Gamepad and mobile support
- New part types: trapdoors, lasers, keypads

---

## Credits

Created by **Your Name**  
Built with Rojo, Luau, and Roblox Studio

---

## License

MIT License — feel free to fork and adapt.
