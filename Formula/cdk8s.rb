require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.32.tgz"
  sha256 "5c315bd8ad737e07018c10a65801c8d0ec91ec064972a8f80389418a86d5e7bf"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "3f648acb833cd9cc8b128b63e9252358ab29e9aafe34b4e825e1cf8bd434ac28"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
