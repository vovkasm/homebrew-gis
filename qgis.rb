require 'formula'

class Qgis < Formula
  url 'http://qgis.org/downloads/qgis-1.8.0.tar.bz2'
  head 'https://github.com/qgis/Quantum-GIS.git'
  homepage 'http://qgis.org/'
  sha1 '99c0d716acbe0dd70ad0774242d01e9251c5a130'

  depends_on 'cmake' => :build
  depends_on 'bison' => :build
  depends_on 'qt'
  depends_on 'qwt'
  depends_on 'proj'
  depends_on 'geos'
  depends_on 'gdal'
  depends_on 'sip'
  depends_on 'pyqt'

  depends_on 'libspatialite'
  depends_on 'spatialindex'

  def install
    # Ok, attaching QWT "Framework" is a bit hacky here
    system "cmake . #{std_cmake_parameters} -DQWT_INCLUDE_DIR=/usr/local/lib/qwt.framework/Headers -DQWT_LIBRARY=/usr/local/lib/qwt -DCMAKE_FIND_FRAMEWORK=LAST -DCMAKE_FRAMEWORK_PATH=/usr/local/lib -DENABLE_TESTS=FALSE"
    system "make install"
  end

  def caveats; <<-EOS
    It may be a good idea to have the gdal installed as

    % brew install gdal --complete

    QGIS.app was installed in:
      #{prefix}

    To symlink into ~/Applications, you can do:
      brew linkapps
    EOS
  end

  def test
    system "open -a #{prefix}/QGis.app"
  end
end
