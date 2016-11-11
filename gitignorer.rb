class Gitignorer < Formula
  desc 'Easily create .gitignore files for your projects'
  homepage 'https://github.com/zachlatta/gitignorer'
  url 'https://github.com/zachlatta/gitignorer/archive/1.0.1.tar.gz'
  sha256 '220c13b4359d74255ae2ed7d8ac8d8e4372aae5be41682ff50df3a0ecea91667'

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath

    directory = "github.com/zachlatta/gitignorer"
    system "mkdir -p src/#{directory}"
    system "mv `ls -A | grep -v src` ./src/#{directory}"
    system "cd src/#{directory}; go get"

    system "cd src/#{directory}; go install"
    bin.install 'bin/gitignorer'
  end

  test do
    system "#{bin}/gitignorer", "help"
  end
end
