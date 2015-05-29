title: my super title
date: 2010-12-03 10:20
modified: 2010-12-05 19:30
category: python
tags: pelican, publishing
slug: shotdetect
authors: alexis metaireau, conan doyle
summary: short version for index and feeds

# Shotdetect

## Shotdetect is a free software (LGPL) which detects shots and scenes from a video.

The result produced is a simple XML file containing all the informations about the movie generated.

## Example

```
shotdetect -i myvideo.avi -o output_dir -s 60 -w -v -f -l -m -r
```

## Options details

```
-s : set threshold
The threshold is the level for shot detection. High will not detect a lot, low will detect a lot of false shots. A good choice is about 60.

-w : generates audio xml information
See the generated file for more details

-v : generates video xml informations
See the generated file for more details

-f : generates the first image of shots
-l : generates the last image of shots
-m : generates the thumbnails images
-r : generates the real size images
```

## Source code

Available on [GitHub](https://github.com/johmathe/Shotdetect)
