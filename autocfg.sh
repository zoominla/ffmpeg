# !/bin/sh
_target=no
test "$1" && _target="$1"
#--disable-everything \
#  --enable-demuxer=rawvideo \
#  --enable-demuxer=pcm_s16le \
#  --enable-demuxer=pcm_u16le \
 # --enable-demuxer=pcm_f32le \
 # --enable-demuxer=pcm_u8 \
 # --enable-decoder=rawvideo \
 # --enable-decoder=pcm_s16le \
 # --enable-decoder=pcm_u16le \
 # --enable-decoder=pcm_f32le \
 # --enable-decoder=pcm_u8 \
 # --enable-encoder=libx264 \
 # --enable-encoder=libfdk_aac \
 
_config_transcli="configure \
  --enable-gpl \
  --enable-nonfree \
  --enable-version3 \
  --enable-shared \
  --enable-pthreads \
  --enable-memalign-hack \
  --enable-libopencore-amrnb --enable-libopencore-amrwb \
  --enable-libx264 --enable-libfdk-aac \
  --enable-runtime-cpudetect \
  --enable-libass \
  --enable-libfreetype \
  --disable-devices \
  --disable-doc \
  --disable-static \
  --disable-ffserver \
  --disable-w32threads \
  --extra-cflags=-U__STRICT_ANSI__ \
  --extra-cflags=-I/mingw/include \
  --extra-libs="-Wl,--enable-auto-import" \
  --extra-libs=-L/mingw/lib \
  --extra-libs=-lenca \
  --extra-libs=-liconv \
  --extra-libs=-lexpat \
  --extra-libs=-lfribidi \
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
  --enable-librtmp \
  --disable-muxers \
  --disable-protocols \
  --disable-devices \
  --enable-muxer=flv \
  --enable-muxer=mp4 \
  --enable-indev=dshow \
  --enable-protocol=rtmp \
  --enable-protocol=rtmps \
  --enable-protocol=file \
  --disable-encoders \
  --enable-encoder=libx264 \
  --enable-encoder=libfdk_aac \
  --disable-decoders \
  --enable-decoder=rawvideo \
  --enable-decoder=pcm_s16le \
  --enable-decoder=pcm_u16le \
  --enable-decoder=pcm_f32le \
  --enable-decoder=pcm_u8 \
  --disable-doc \
  --disable-static \
  --disable-ffserver \
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
