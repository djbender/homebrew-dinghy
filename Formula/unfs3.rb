class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "http://unfs3.github.io"
  url "https://github.com/unfs3/unfs3/archive/unfs3-0.9.22.tar.gz"
  sha256 "394a5df491f4e8caeacfed0fec86690f7772badb79be986191f0d598a0d38995"

  head do
    url "https://github.com/unfs3/unfs3.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    ENV.deparallelize # Build is not parallel-safe
    system "./bootstrap" if build.head?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
