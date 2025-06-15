class SshSync < Formula
    desc "SSH syncing application built with Go"
    homepage "https://therealpaulgg.github.io/ssh-sync"
    url "https://api.github.com/repos/therealpaulgg/ssh-sync/tarball/v1.1.4"
    sha256 "fcc4c7beaff02555cdfb8c29371f7803c46e0d46b699f0bc18cec4a69fead548"
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
  
