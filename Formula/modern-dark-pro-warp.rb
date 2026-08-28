class ModernDarkProWarp < Formula
  desc "A premium, modern, and dark-mode-optimized Warp Terminal theme"
  homepage "https://github.com/dvigo/modern-dark-pro-warp"
  url "https://github.com/dvigo/modern-dark-pro-warp/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "71f95127059b5a3d5fba3fe6e69e0604b489ed8968e4f1b0aaf5458a57415b32"
  head "https://github.com/dvigo/modern-dark-pro-warp.git", branch: "main"
  version "1.1.0"
  license "MIT"

  def install
    prefix.install "themes"
    prefix.install "backgrounds" if File.directory?("backgrounds")
    prefix.install "install.sh"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      To finish installing the Modern Dark Pro Warp themes to Warp's local theme directory, run:
      
        #{opt_prefix}/install.sh
      
      To uninstall the themes later, run:
      
        #{opt_prefix}/install.sh --uninstall
    EOS
  end

  test do
    assert_predicate prefix/"install.sh", :exist?
    assert_predicate prefix/"themes/modern-dark-pro-night.yaml", :exist?
  end
end
