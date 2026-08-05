class ModernDarkProWarp < Formula
  desc "A premium, modern, and dark-mode-optimized Warp Terminal theme"
  homepage "https://github.com/dvigo/modern-dark-pro-warp"
  url "https://github.com/dvigo/modern-dark-pro-warp.git", branch: "main"
  version "1.1.0"
  license "MIT"

  def install
    warp_themes_dir = ENV["HOME"] + "/.warp/themes"
    warp_bg_dir = warp_themes_dir + "/backgrounds"
    
    # We use Homebrew's post_install or caveats to tell users how to install
    # because Homebrew shouldn't write to the user's home directory during `brew install`.
    
    prefix.install "themes"
    prefix.install "backgrounds"
    prefix.install "install.sh"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      To finish installing the Modern Dark Pro Warp themes, run the installer:
      
        #{prefix}/install.sh
      
      To uninstall the themes later, run:
      
        #{prefix}/install.sh --uninstall
    EOS
  end

  test do
    system "test", "-f", "#{prefix}/install.sh"
  end
end
