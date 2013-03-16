# Build a local version
INCLUDE(ExternalProject)

SET(physfs_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/physfs)

SET(physfs_CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
    -DCMAKE_DEBUG_POSTFIX=d
    -DPHYSFS_BUILD_TEST=FALSE
    -DPHYSFS_BUILD_SHARED=FALSE
    -DPHYSFS_BUILD_WX_TEST=FALSE
)

ExternalProject_Add(physfs
    PREFIX ${physfs_PREFIX}

    DOWNLOAD_DIR ${POLYCODE_DEPS_DOWNLOAD_DIR}

    URL http://icculus.org/physfs/downloads/physfs-2.0.3.tar.bz2
    URL_MD5 c2c727a8a8deb623b521b52d0080f613

    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${PolycodeDependencies_SOURCE_DIR}/../CMake/physfs.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${POLYCODE_DEPS_CORE_PREFIX}
    CMAKE_ARGS ${physfs_CMAKE_ARGS}
)

