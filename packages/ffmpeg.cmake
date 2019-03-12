ExternalProject_Add(ffmpeg
    DEPENDS
        # amf-headers
        nvcodec-headers
        bzip2
        # game-music-emu
        # gmp
        lame
        # libressl
        # libass
        # libbluray
        # libmodplug
        libpng
        libsoxr
        # libvpx
        # libzimg
        # libmysofa
        # opus
        # speex
        vorbis
        # x264
        xvidcore
        libxml2
        # libmfx
        aom
        dav1d
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --target-exec=wine
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-small
        --enable-gpl
        --enable-version3
        # --enable-nonfree
        --disable-avresample
        --disable-postproc
        --disable-avisynth
        --disable-gmp
        --disable-doc
        --disable-libfribidi
        --disable-libass
        --disable-libbluray
        --disable-libfreetype
        --disable-libgme
        --disable-libmodplug
        --enable-libmp3lame
        --disable-libopus
        --enable-libsoxr
        --disable-libspeex
        --disable-libvorbis
        --disable-libvpx
        --disable-libx264
        --disable-libaom
        --enable-libdav1d #no-macos
        --disable-libxvid
        --disable-libzimg
        --disable-libtls
        --disable-libxml2
        --disable-libmysofa
        --enable-cuda #no-macos
        --enable-cuvid #no-macos
        --enable-nvdec #no-macos
        --enable-nvenc #no-macos
        --disable-libmfx
        --disable-lzma
        --disable-amf
        --disable-decoder=libaom_av1 #no-macos
        --disable-w32threads
        "--extra-cflags=-DMODPLUG_STATIC"
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
extra_step(ffmpeg)
