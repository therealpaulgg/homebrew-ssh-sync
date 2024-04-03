class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://api.github.com/repos/therealpaulgg/ssh-sync/tarball/v1.0.0"
    sha256 "8ba2671b350e654622600c3906c645d105992a94bac23cea1b1dacec88189d66"
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
  