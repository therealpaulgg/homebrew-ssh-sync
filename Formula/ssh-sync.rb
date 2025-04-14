class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://api.github.com/repos/therealpaulgg/ssh-sync/tarball/v1.1.2"
    sha256 "e5d9d0019c4fa2a7d414369bc075a02a624eb7ccd69be0fd73e9a6c4bdabe98b"
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
  
