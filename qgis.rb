require 'formula'

class Qgis < Formula
  url 'http://qgis.org/downloads/qgis-1.7.3.tar.bz2'
  head 'https://github.com/qgis/Quantum-GIS.git'
  homepage 'http://qgis.org/'
  md5 'e1b3b1f33ea8d648bde0eddf54f7eb90'

  depends_on 'cmake' => :build
  depends_on 'homebrew/dupes/bison' => :build
  depends_on 'qt'
  depends_on 'qwt'
  depends_on 'proj'
  depends_on 'geos'
  depends_on 'gdal'
  depends_on 'sip'
  depends_on 'pyqt'

#  def patches
#    DATA
#  end

  def install
    system "cmake . #{std_cmake_parameters} -DQWT_INCLUDE_DIR=/usr/local/lib/qwt.framework/Headers -DCMAKE_FIND_FRAMEWORK=LAST -DCMAKE_FRAMEWORK_PATH=/usr/local/lib"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test qgis`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end

__END__
diff --git a/cmake/FindGDAL.cmake b/cmake/FindGDAL.cmake
index d81f7ca..7837df4 100644
--- a/cmake/FindGDAL.cmake
+++ b/cmake/FindGDAL.cmake
@@ -40,32 +40,32 @@ ELSE(WIN32)
 
     # try to use framework on mac
     # want clean framework path, not unix compatibility path
-    IF (APPLE)
-      IF (CMAKE_FIND_FRAMEWORK MATCHES "FIRST"
-          OR CMAKE_FRAMEWORK_PATH MATCHES "ONLY"
-          OR NOT CMAKE_FIND_FRAMEWORK)
-        SET (CMAKE_FIND_FRAMEWORK_save ${CMAKE_FIND_FRAMEWORK} CACHE STRING "" FORCE)
-        SET (CMAKE_FIND_FRAMEWORK "ONLY" CACHE STRING "" FORCE)
-        FIND_LIBRARY(GDAL_LIBRARY GDAL)
-        IF (GDAL_LIBRARY)
-          # they're all the same in a framework
-          SET (GDAL_INCLUDE_DIR ${GDAL_LIBRARY}/Headers CACHE PATH "Path to a file.")
-          # set GDAL_CONFIG to make later test happy, not used here, may not exist
-          SET (GDAL_CONFIG ${GDAL_LIBRARY}/unix/bin/gdal-config CACHE FILEPATH "Path to a program.")
-          # version in info.plist
-          GET_VERSION_PLIST (${GDAL_LIBRARY}/Resources/Info.plist GDAL_VERSION)
-          IF (NOT GDAL_VERSION)
-            MESSAGE (FATAL_ERROR "Could not determine GDAL version from framework.")
-          ENDIF (NOT GDAL_VERSION)
-          STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\1" GDAL_VERSION_MAJOR "${GDAL_VERSION}")
-          STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\2" GDAL_VERSION_MINOR "${GDAL_VERSION}")
-          IF (GDAL_VERSION_MAJOR LESS 1 OR GDAL_VERSION_MINOR LESS 4)
-            MESSAGE (FATAL_ERROR "GDAL version is too old (${GDAL_VERSION}). Use 1.4.0 or higher.")
-          ENDIF (GDAL_VERSION_MAJOR LESS 1 OR GDAL_VERSION_MINOR LESS 4)
-        ENDIF (GDAL_LIBRARY)
-        SET (CMAKE_FIND_FRAMEWORK ${CMAKE_FIND_FRAMEWORK_save} CACHE STRING "" FORCE)
-      ENDIF ()
-    ENDIF (APPLE)
+    # IF (APPLE)
+    #   IF (CMAKE_FIND_FRAMEWORK MATCHES "FIRST"
+    #       OR CMAKE_FRAMEWORK_PATH MATCHES "ONLY"
+    #       OR NOT CMAKE_FIND_FRAMEWORK)
+    #     SET (CMAKE_FIND_FRAMEWORK_save ${CMAKE_FIND_FRAMEWORK} CACHE STRING "" FORCE)
+    #     SET (CMAKE_FIND_FRAMEWORK "ONLY" CACHE STRING "" FORCE)
+    #     FIND_LIBRARY(GDAL_LIBRARY GDAL)
+    #     IF (GDAL_LIBRARY)
+    #       # they're all the same in a framework
+    #       SET (GDAL_INCLUDE_DIR ${GDAL_LIBRARY}/Headers CACHE PATH "Path to a file.")
+    #       # set GDAL_CONFIG to make later test happy, not used here, may not exist
+    #       SET (GDAL_CONFIG ${GDAL_LIBRARY}/unix/bin/gdal-config CACHE FILEPATH "Path to a program.")
+    #       # version in info.plist
+    #       GET_VERSION_PLIST (${GDAL_LIBRARY}/Resources/Info.plist GDAL_VERSION)
+    #       IF (NOT GDAL_VERSION)
+    #         MESSAGE (FATAL_ERROR "Could not determine GDAL version from framework.")
+    #       ENDIF (NOT GDAL_VERSION)
+    #       STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\1" GDAL_VERSION_MAJOR "${GDAL_VERSION}")
+    #       STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\2" GDAL_VERSION_MINOR "${GDAL_VERSION}")
+    #       IF (GDAL_VERSION_MAJOR LESS 1 OR GDAL_VERSION_MINOR LESS 4)
+    #         MESSAGE (FATAL_ERROR "GDAL version is too old (${GDAL_VERSION}). Use 1.4.0 or higher.")
+    #       ENDIF (GDAL_VERSION_MAJOR LESS 1 OR GDAL_VERSION_MINOR LESS 4)
+    #     ENDIF (GDAL_LIBRARY)
+    #     SET (CMAKE_FIND_FRAMEWORK ${CMAKE_FIND_FRAMEWORK_save} CACHE STRING "" FORCE)
+    #   ENDIF ()
+    # ENDIF (APPLE)
 
     IF (NOT GDAL_INCLUDE_DIR OR NOT GDAL_LIBRARY OR NOT GDAL_CONFIG)
       # didn't find OS X framework, and was not set by user
diff --git a/cmake/FindGEOS.cmake b/cmake/FindGEOS.cmake
index e7f8a83..11b22b0 100644
--- a/cmake/FindGEOS.cmake
+++ b/cmake/FindGEOS.cmake
@@ -45,32 +45,32 @@ ELSE(WIN32)
 
     # try to use framework on mac
     # want clean framework path, not unix compatibility path
-    IF (APPLE)
-      IF (CMAKE_FIND_FRAMEWORK MATCHES "FIRST"
-          OR CMAKE_FRAMEWORK_PATH MATCHES "ONLY"
-          OR NOT CMAKE_FIND_FRAMEWORK)
-        SET (CMAKE_FIND_FRAMEWORK_save ${CMAKE_FIND_FRAMEWORK} CACHE STRING "" FORCE)
-        SET (CMAKE_FIND_FRAMEWORK "ONLY" CACHE STRING "" FORCE)
-        FIND_LIBRARY(GEOS_LIBRARY GEOS)
-        IF (GEOS_LIBRARY)
-          # they're all the same in a framework
-          SET (GEOS_INCLUDE_DIR ${GEOS_LIBRARY}/Headers CACHE PATH "Path to a file.")
-          # set GEOS_CONFIG to make later test happy, not used here, may not exist
-          SET (GEOS_CONFIG ${GEOS_LIBRARY}/unix/bin/geos-config CACHE FILEPATH "Path to a program.")
-          # version in info.plist
-          GET_VERSION_PLIST (${GEOS_LIBRARY}/Resources/Info.plist GEOS_VERSION)
-          IF (NOT GEOS_VERSION)
-            MESSAGE (FATAL_ERROR "Could not determine GEOS version from framework.")
-          ENDIF (NOT GEOS_VERSION)
-          STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\1" GEOS_VERSION_MAJOR "${GEOS_VERSION}")
-          STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\2" GEOS_VERSION_MINOR "${GEOS_VERSION}")
-          IF (GEOS_VERSION_MAJOR LESS 3)
-            MESSAGE (FATAL_ERROR "GEOS version is too old (${GEOS_VERSION}). Use 3.0.0 or higher.")
-          ENDIF (GEOS_VERSION_MAJOR LESS 3)
-        ENDIF (GEOS_LIBRARY)
-        SET (CMAKE_FIND_FRAMEWORK ${CMAKE_FIND_FRAMEWORK_save} CACHE STRING "" FORCE)
-      ENDIF ()
-    ENDIF (APPLE)
+    # IF (APPLE)
+    #   IF (CMAKE_FIND_FRAMEWORK MATCHES "FIRST"
+    #       OR CMAKE_FRAMEWORK_PATH MATCHES "ONLY"
+    #       OR NOT CMAKE_FIND_FRAMEWORK)
+    #     SET (CMAKE_FIND_FRAMEWORK_save ${CMAKE_FIND_FRAMEWORK} CACHE STRING "" FORCE)
+    #     SET (CMAKE_FIND_FRAMEWORK "ONLY" CACHE STRING "" FORCE)
+    #     FIND_LIBRARY(GEOS_LIBRARY GEOS)
+    #     IF (GEOS_LIBRARY)
+    #       # they're all the same in a framework
+    #       SET (GEOS_INCLUDE_DIR ${GEOS_LIBRARY}/Headers CACHE PATH "Path to a file.")
+    #       # set GEOS_CONFIG to make later test happy, not used here, may not exist
+    #       SET (GEOS_CONFIG ${GEOS_LIBRARY}/unix/bin/geos-config CACHE FILEPATH "Path to a program.")
+    #       # version in info.plist
+    #       GET_VERSION_PLIST (${GEOS_LIBRARY}/Resources/Info.plist GEOS_VERSION)
+    #       IF (NOT GEOS_VERSION)
+    #         MESSAGE (FATAL_ERROR "Could not determine GEOS version from framework.")
+    #       ENDIF (NOT GEOS_VERSION)
+    #       STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\1" GEOS_VERSION_MAJOR "${GEOS_VERSION}")
+    #       STRING(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\2" GEOS_VERSION_MINOR "${GEOS_VERSION}")
+    #       IF (GEOS_VERSION_MAJOR LESS 3)
+    #         MESSAGE (FATAL_ERROR "GEOS version is too old (${GEOS_VERSION}). Use 3.0.0 or higher.")
+    #       ENDIF (GEOS_VERSION_MAJOR LESS 3)
+    #     ENDIF (GEOS_LIBRARY)
+    #     SET (CMAKE_FIND_FRAMEWORK ${CMAKE_FIND_FRAMEWORK_save} CACHE STRING "" FORCE)
+    #   ENDIF ()
+    # ENDIF (APPLE)
 
     IF (NOT GEOS_INCLUDE_DIR OR NOT GEOS_LIBRARY OR NOT GEOS_CONFIG)
       # didn't find OS X framework, and was not set by user
 

