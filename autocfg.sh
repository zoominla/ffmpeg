# !/bin/sh
_target=no
test "$1" && _target="$1"

_config="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-libtheora \
  --enable-version3 \
  --enable-shared \
  --enable-postproc \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-libopencore-amrnb \
  --enable-libopencore-amrwb \
  --enable-runtime-cpudetect \
  --enable-libass \
  --disable-doc \
  --disable-static \
  --disable-devices \
  --disable-avdevice \
  --disable-ffserver \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-libs="-Wl,--enable-auto-import" 
  --extra-libs=-liconv \
  --extra-libs=-lenca \
  --extra-libs=-lexpat \
  --extra-libs=-lfreetype \
  --extra-libs=-lfribidi"

_config_lite="\
  --disable-ffmpeg \
  --disable-muxers \
  --disable-encoders \
  --enable-encoder=mpeg1video \
  --enable-encoder=huffyuv \
  --enable-encoder=png \
  --enable-encoder=rawvideo \
  --enable-encoder=snow \
  --enable-encoder=zlib \
  --enable-encoder=zmbv \
  --enable-muxer=rawvideo \
  --enable-muxer=wav \
  --prefix=/usr/local/ffmpeg"

if test $_target = lite ; then
	_config+=$_config_lite
else
    _config+=" --enable-libmp3lame --enable-libaacplus --extra-cflags=-I/usr/local/x264/include --extra-ldflags=-L/usr/local/x264/lib --prefix=/usr/local/ffmpeg"
fi

./$_config
