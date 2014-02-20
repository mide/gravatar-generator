all: resize
resize: icon-512.png icon-256.png icon-128.png icon-64.png icon-32.png icon-16.png

background.txt:
	< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c 5000 | fold -w 100 > background.txt

background.png: background.txt
	cat background.txt | \
		convert -background black -fill "#333" -font Courier -pointsize 14 \
		-crop 512x512+50+50 \
		text:- background.png

icon.png: background.png
	convert -fill white -font Century-Schoolbook-L-Roman -pointsize 200 \
		-gravity Center -draw 'text 0,-100 "mide"' background.png icon.png

icon-512.png: icon.png
	convert icon.png -resize 512x512 icon-512.png

icon-256.png: icon.png
	convert icon.png -resize 256x256 icon-256.png

icon-128.png: icon.png
	convert icon.png -resize 128x128 icon-128.png

icon-64.png: icon.png
	convert icon.png -resize 64x64 icon-64.png

icon-32.png: icon.png
	convert icon.png -resize 32x32 icon-32.png

icon-16.png: icon.png
	convert icon.png -resize 16x16 icon-16.png

clean:
	rm -vf *.png
	rm -vf background.txt
