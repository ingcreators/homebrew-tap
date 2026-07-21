# typed: false
# frozen_string_literal: true

# TesseraQL CLI — installs the portable jar distribution and runs it on
# Homebrew's OpenJDK (the dist launcher requires JDK 21+; `openjdk` is
# keg-only on macOS, so the wrapper prepends it to PATH instead of
# relying on a system `java`).
class Tesseraql < Formula
  desc "CLI for TesseraQL, the SQL-first hypermedia application framework"
  homepage "https://ingcreators.com/tesseraql"
  url "https://github.com/ingcreators/tesseraql/releases/download/v0.7.1/tesseraql-cli-0.7.1-dist.tar.gz"
  sha256 "e809d0c3258a850dc2eab0893718c99043454b8b4ed7411f30a0661caf3db7f1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "openjdk"

  def install
    # Keep the dist layout intact (bin/ launcher, lib/tesseraql.jar,
    # modules/ codec closure) — the launcher resolves lib/ relative to
    # itself, and `serve --modules` expects the sibling directory.
    libexec.install Dir["*"]
    (bin/"tesseraql").write_env_script libexec/"bin/tesseraql",
      PATH: "#{Formula["openjdk"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tesseraql --version")
  end
end
