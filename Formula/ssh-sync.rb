class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://api.github.com/repos/therealpaulgg/ssh-sync/tarball/v1.1.4"
    sha256 "f42651a0e71a2a8291d31fc9fb4f298072dec5e18f2b5f5957b64f03b8d853be"
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
  
