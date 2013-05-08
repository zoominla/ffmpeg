# !/bin/sh
_target=no
test "$1" && _target="$1"

_config_transcli="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-version3 \
  --enable-shared \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-libopencore-amrnb --enable-libopencore-amrwb \
  --enable-runtime-cpudetect \
  --enable-libass \
  --enable-libfreetype \
  --enable-fontconfig \
  --disable-devices \
  --disable-doc \
  --disable-static \
  --disable-ffserver \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-cflags=-I/mingw/include \
  --extra-libs="-Wl,--enable-auto-import" \
  --extra-libs=-liconv -lenca -lexpat -lfribidi \
  --prefix=/usr/local/ffmpeg_transcli"

_config_show="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-shared \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-runtime-cpudetect \
  --enable-libx264 \
  --enable-libfdk-aac \
  --disable-doc \
  --disable-static \
  --disable-ffserver \
  --disable-network \
  --disable-ffprobe \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-cflags=-I/mingw/include \
  --prefix=/usr/local/ffmpeg_show"
  
_config_lite="configure \
  --disable-ffmpeg \
  --disable-static \
  --disable-devices \
  --disable-avdevice \
  --disable-ffserver \
  --disable-muxers \
  --disable-encoders \
  --disable-filters \
  --disable-avfilter \
  --disable-swresample \
  --disable-swscale \
  --disable-postproc \
  --disable-bsfs \
  --disable-indevs \
  --disable-outdevs \
  --disable-debug \
  --enable-shared \
  --enable-muxer=rawvideo \
  --enable-muxer=wav \
  --enable-pthreads \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-cflags=-I/mingw/include \
  --prefix=/usr/local/ffmpeg_lite"

_config=$_config_transcli
if test $_target = lite; then
	_config=$_config_lite
elif test $_target = show; then
    _config=$_config_show 
fi
_config+=""
./$_config
