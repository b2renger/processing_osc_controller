# processing_osc_controller

The goal is to build osc compliant applications with processing but streamlining the process. Those application are compatible with the android mode of processing, thus enabling to create custom on the fly osc controllers application for android.


The process will consist of using Pure-Data as a WYSIWYG editor for interfaces. This program will parse the pd patch to create the rigthfull gui elements through controlP5.

## Software dependencies

- ControlP5 lib for processing
- OSCP5 lib for processing
- android mode for processing (optional)

## How to run ?
- create a pd patch with gui elements
- open the processing template and save it somewhere
- drop the pd patch containing the interface on the processing window
- click run (you should see a replicate of the interface you built but with osc networking)

- (optionally) run in android-mode to get an android app.

## What should be supported ?
x buttons
x toggles
x sliders
x radio button
x 2d-pad
x selection through a list of items
x color selector
x text-entry

x edit multiple page layouts
x customize colors

## What is OSC ?

## What is Pure-data ?

## How to build an interface with Pure-Data ?