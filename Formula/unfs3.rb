class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "http://unfs3.github.io"
  url "https://github.com/unfs3/unfs3/archive/unfs3-0.9.22.tar.gz"
  sha256 "9708d2012b072d0cfdc32559a07344cd8d17f44e3118874e0c2471b9877032d7"

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
