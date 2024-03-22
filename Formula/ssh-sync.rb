class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://github.com/therealpaulgg/ssh-sync/archive/refs/tags/v0.3.6.tar.gz"
    sha256 "1febbce02a1ae46cc35d347da0f2bed798b0a743805438cc083c4023ab0d143e"
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
  