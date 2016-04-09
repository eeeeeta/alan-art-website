#!/bin/bash

echo "Adding $1 to collection..."
mv -v "$1" ./_artworks/
printf "Generating scaled thumbs."
convert "./_artworks/$1" -geometry x200 "./_artworks/$(echo $1 | cut -f 1 -d '.')_200.jpg"
printf "."
convert "./_artworks/$1" -geometry x300 "./_artworks/$(echo $1 | cut -f 1 -d '.')_300.jpg"
echo ".done."
echo "Copying example metadata..."
echo -e "---\nlayout: artwork\nimage_base: /artworks/$(echo $1 | cut -f 1 -d '.')\nimage_ext: $(echo $1 | cut -f 2 -d '.')\n---\n" > "./_artworks/$(echo $1 | cut -f 1 -d '.').md"
echo "Done! Opening nano in 1 second at metadata file."
sleep 1
nano "./_artworks/$(echo $1 | cut -f 1 -d '.').md"
