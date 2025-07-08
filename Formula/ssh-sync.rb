class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
  
