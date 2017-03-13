all: resize
resize: icon-512.png icon-256.png icon-128.png icon-064.png icon-032.png icon-016.png

icon.png:
	convert -background black -fill white \
		-font poiret-one-v4-latin-regular.ttf \
		-pointsize 250 label:mide \
		-gravity center \
		-extent 512x512 \
		icon.png

icon-512.png: icon.png
	convert icon.png -resize 512x512 icon-512.png

icon-256.png: icon.png
	convert icon.png -resize 256x256 icon-256.png

icon-128.png: icon.png
	convert icon.png -resize 128x128 icon-128.png

icon-064.png: icon.png
	convert icon.png -resize 64x64 icon-064.png

icon-032.png: icon.png
	convert icon.png -resize 32x32 icon-032.png

icon-016.png: icon.png
	convert icon.png -resize 16x16 icon-016.png

clean:
	rm -f *.png
