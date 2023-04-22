#!/bin/bash -e

. ./include/depinfo.sh

[ -z "$TRAVIS" ] && TRAVIS=0
[ -z "$WGET" ] && WGET="wget -q"

mkdir -p deps && cd deps

# mbedtls
if [ ! -d mbedtls ]; then
	mkdir mbedtls
	$WGET https://github.com/ARMmbed/mbedtls/archive/mbedtls-$v_mbedtls.tar.gz -O - | \
		tar -xz -C mbedtls --strip-components=1
fi

#libxml2
if [ ! -d libxml2 ]; then
	mkdir libxml2
	$WGET https://gitlab.gnome.org/GNOME/libxml2/-/archive/v$v_libxml2/libxml2-v$v_libxml2.tar.gz -O - | \
		tar -xz -C libxml2 --strip-components=1
fi

# dav1d
[ ! -d dav1d ] && git clone https://github.com/videolan/dav1d --depth 1

# ffmpeg
[ ! -d ffmpeg ] && git clone https://github.com/FFmpeg/FFmpeg -b $v_ffmpeg ffmpeg --depth 1

# freetype2
[ ! -d freetype2 ] && git clone git://git.sv.nongnu.org/freetype/freetype2.git -b VER-$v_freetype --depth 1

# fribidi
if [ ! -d fribidi ]; then
	mkdir fribidi
	$WGET https://github.com/fribidi/fribidi/releases/download/v$v_fribidi/fribidi-$v_fribidi.tar.xz -O - | \
		tar -xJ -C fribidi --strip-components=1
fi

# harfbuzz
if [ ! -d harfbuzz ]; then
	mkdir harfbuzz
	$WGET https://github.com/harfbuzz/harfbuzz/releases/download/$v_harfbuzz/harfbuzz-$v_harfbuzz.tar.xz -O - | \
		tar -xJ -C harfbuzz --strip-components=1
fi

# libass
[ ! -d libass ] && git clone https://github.com/libass/libass --detph 1

# lua
if [ ! -d lua ]; then
	mkdir lua
	$WGET http://www.lua.org/ftp/lua-$v_lua.tar.gz -O - | \
		tar -xz -C lua --strip-components=1
fi

# mpv
[ ! -d mpv ] && git clone https://github.com/mpv-player/mpv --depth 1

cd ..
