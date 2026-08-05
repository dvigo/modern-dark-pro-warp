# 🎨 Modern Dark Pro - Warp Terminal Theme

A premium, modern, and dark-mode-optimized Warp Terminal theme inspired by the [Modern Dark Pro](https://github.com/dvigo/modern-dark-pro) color palettes. 

Designed for developers who appreciate elegant contrast, clean typography, and low eye strain during long coding sessions.

---

## ✨ Features

- **🚀 Multiple Variant Support**: Choose between:
  - **Night** (subtle pastel tones, OLED-ready soft black background)
  - **Night Glass** (features an elegant dark mesh background image)
  - **Monokai** (classic vibrant Monokai accents, warm dark background)
  - **Dracula** (vibrant purple-centered classic dark aesthetic)
- **🎨 High-Contrast & Accessible**: Tuned ANSI color mappings for excellent syntax highlighting legibility in terminal logs, CLI utilities, and prompts.

---

## 🎥 Demo

<div align="center">
  <!-- TODO: Add a GIF or video demonstrating the terminal in action here -->
  <p><i>Demo Video Placeholder</i></p>
</div>

---

## 🎨 Color Palettes & Variants

### 1. Night Variant (Default)
Soft, elegant pastel colors optimized for modern dark displays.

<div align="center">
  <img src="screenshots/modern-dark-pro.png" width="800" alt="Night Variant Screenshot" />
</div>

- **Background**: `#0f0f0f`
- **Foreground/Text**: `#e0e0e0`
- **Accent**: `#64b5f6` (Light Blue)
- **ANSI Palette**: Tuned with soft red (`#e57373`), green (`#81c784`), orange/yellow (`#ffb74d`), purple (`#ba68c8`), and cyan (`#4dd0e1`).

### 2. Monokai Variant
The classic high-contrast Monokai theme colors adapted for terminal use.

<div align="center">
  <img src="screenshots/modern-dark-pro-monokai.png" width="800" alt="Monokai Variant Screenshot" />
</div>

- **Background**: `#272822`
- **Foreground/Text**: `#f8f8f2`
- **Accent**: `#ae81ff` (Purple)
- **ANSI Palette**: Featuring classic Monokai green (`#a6e22e`), blue (`#66d9ef`), yellow (`#e6db74`), and magenta (`#f92672`).

### 3. Dracula Variant
A vibrant, modern take on the iconic Dracula color palette.

<div align="center">
  <img src="screenshots/modern-dark-pro-dracula.png" width="800" alt="Dracula Variant Screenshot" />
</div>

- **Background**: `#282a36`
- **Foreground/Text**: `#f8f8f2`
- **Accent**: `#bd93f9` (Dracula Purple)
- **ANSI Palette**: Dracula pink (`#ff79c6`), cyan (`#8be9fd`), yellow (`#f1fa8c`), green (`#50fa7b`), and red (`#ff5555`).

---

## 🧪 ANSI Color Test

Run a color test script (e.g. `msgcat --color=test`) to verify the contrast and legibility of the colors.

<div align="center">
  <!-- TODO: Add a screenshot of an ANSI color test here -->
  <p><i>ANSI Color Test Screenshot Placeholder</i></p>
</div>

---

## 📦 Installation

### Option 1: Homebrew (macOS)
You can easily install the themes using Homebrew:
```bash
brew tap dvigo/modern-dark-pro-warp https://github.com/dvigo/modern-dark-pro-warp
brew install modern-dark-pro-warp
```
*Note: Homebrew will place the themes in the Homebrew prefix. To finish installation to Warp's local folder, follow the caveats printed after installation.*

### Option 2: Manual Installation

### Step 1: Clone the repository
Clone this project into a local folder:
```bash
git clone https://github.com/dvigo/modern-dark-pro-warp.git ~/dev/modern-dark-pro-warp
```

### Step 2: Run the installer
Run the provided installer script, which copies the theme configuration files to Warp's local custom themes folder (`~/.warp/themes/`):
```bash
cd ~/dev/modern-dark-pro-warp
./install.sh
```

To **uninstall**, you can run:
```bash
./install.sh --uninstall
```

---

## 🚀 How to Apply the Theme

1. Open **Warp Terminal**.
2. Press `Cmd + ,` to open **Settings**.
3. Select **Appearance** from the sidebar.
4. Under the **Themes** section, scroll down to the **Custom** category.
5. Choose your preferred variant:
   - `Modern Dark Pro - Night`
   - `Modern Dark Pro - Monokai`
   - `Modern Dark Pro - Dracula`

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
