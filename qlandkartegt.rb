require 'formula'

class Qlandkartegt < Formula
  url 'http://sourceforge.net/projects/qlandkartegt/files/qlandkartegt/QLandkarteGT%201.6.0/qlandkartegt-1.6.0.tar.gz'
  homepage 'http://www.qlandkarte.org/'
  sha1 '78365eeaeb9d270311c8c451c7ab34ef321ec5e4'

  depends_on 'cmake' => :build
  depends_on 'qt'
  depends_on 'gdal'
  depends_on 'proj'
  depends_on 'libexif'
  depends_on 'libdmtx'
  depends_on 'jpeg'

  def install
    system "cmake . #{std_cmake_parameters} -DPROJ_LIBRARIES=/usr/local/lib/libproj.dylib -DPROJ_INCLUDE_DIRS=/usr/local/include"
    system "make"

    prefix.install "bin/QLandkarte GT.app"
  end

  def caveats; <<-EOS
    Note, that qt dependency should be installed as

    % brew install qt --with-qtdbus

    (you check it with 'brew info qt')

    It may be also a good idea to have the gdal installed as

    % brew install gdal --complete

    QLandkarte GT.app was installed in:
      #{prefix}

    To symlink into ~/Applications, you can do:
      brew linkapps
    EOS
  end

  def test
    system "open -a #{prefix}/'QLandkarte GT.app'"
  end

end
