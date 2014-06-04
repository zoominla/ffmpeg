# !/bin/sh
_target=no
test "$1" && _target="$1"

_config="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-version3 \
  --enable-shared \
  --enable-postproc \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-runtime-cpudetect \
  --enable-network \
  --enable-protocols \
  --disable-doc \
  --disable-static \
  --disable-devices \
  --disable-avdevice \
  --enable-ffserver \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-libs="-Wl,--enable-auto-import" "

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
    _config+=" --enable-libx264 --enable-libfdk-aac --prefix=/usr"
fi

./$_config
