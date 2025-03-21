# Fish Shell Configuration

Welcome to my **Fish Shell Configuration**! 🐟 This setup is designed to enhance your terminal experience with a mix of **aesthetics, efficiency, and automation**. It includes custom aliases, functions, an interactive prompt, and a personalized startup banner.

## 📌 Features

### 🎨 Aesthetic & Interactive Startup
- **ASCII Art Banner**: A visually appealing welcome message.
- **Animated Startup Messages**: Displays a sequence of messages for a smooth startup feel.
- **Random Inspirational Quotes**: Keeps your terminal motivational with a different quote on each session.

### 🚀 Optimized Terminal Experience
- **Enhanced Prompt**:
  - Displays `username@hostname` with color coding.
  - Shows the current directory.
  - Displays the active Git branch when inside a repository.
- **Aliases & Abbreviations**:
  - **Git Shortcuts**: (`gs` for `git status`, `gc` for `git commit`, `push`, etc.)
  - **System Utilities**:
    - `update`: Updates system packages (Arch-based `pacman` and `yay` AUR helper).
    - `yay-update`: Updates only AUR packages.
    - `pac-clean`: Cleans package cache.

### 🛠️ Custom Functions
- **Archive Extraction (`extract`)**:
  - Automatically extracts `.zip`, `.tar.gz`, `.7z`, and more.
- **Improved Command History**:
  - Prevents duplicate history entries for a cleaner command recall.
- **Custom Environment Variables**:
  - `EDITOR` and `VISUAL` set to `vim`.
  - `TERM` set to `xterm-256color` for better color handling.
- **Node.js Version Management**:
  - Uses `fnm` (Fast Node Manager) for flexible Node.js version control.

## 🔧 Installation
### Switching from Any Existing Shell to Fish
1. **Install Fish** (if not already installed):
   - On Arch Linux:
     ```
     sudo pacman -S fish
     ```
   - On Ubuntu/Debian:
     ```
     sudo apt install fish
     ```
   - On macOS (using Homebrew):
     ```
     brew install fish
     ```

2. **Change the default shell to Fish**:
   ```
   chsh -s $(which fish)
   ```
   - Log out and back in for changes to take effect.

3. **Manually switch to Fish (without changing default shell)**:
   ```
   fish
   ```

4. **Clone this repository into your Fish configuration directory**:
   ```
   git clone https://github.com/sid-lakhani/fish-config.git ~/.config/fish
   ```

5. **Restart Fish**:
   ```
   exec fish
   ```

6. Enjoy your enhanced Fish shell! 🎉

## 📂 File Structure
```plaintext
~/.config/fish/
├── config.fish  # Main configuration file
├── functions/   # Custom Fish functions
└── conf.d/      # Additional startup scripts
```

## 🤝 Contributing
We welcome contributions to improve this Fish configuration! Here’s how you can help:

1. **Fork the repository** on GitHub.
2. **Clone your fork** locally:
   ```
   git clone https://github.com/sid-lakhani/fish-config.git
   ```
3. **Create a new branch** for your changes:
   ```
   git checkout -b my-new-feature
   ```
4. **Make your modifications** (add aliases, improve functions, tweak prompts, etc.).
5. **Commit and push your changes**:
   ```
   git add .
   git commit -m "Added a new feature"
   git push origin my-new-feature
   ```
6. **Submit a pull request** on GitHub, and we’ll review your changes!

## 📜 License
This configuration is open-source under the MIT License. Feel free to modify and use it as you like! 🚀

