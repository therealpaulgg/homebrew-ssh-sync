class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://api.github.com/repos/therealpaulgg/ssh-sync/tarball/v1.1.5"
    sha256 "bf72106202a3641930f8232a63903ab989f34034d0fc73659f9bf44c01799f79"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      ldflags = "-X main.version=v#{version}"
      system "go", "build", "-o", bin/"ssh-sync", "-ldflags", ldflags, "."
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/ssh-sync --version", 2)
    end
  end
  
