# processing_osc_controller

The goal is to build osc compliant applications with processing but streamlining the process. Those application are compatible with the android mode of processing, thus enabling to create custom on the fly osc controller applications for android.

The process will consist of using Pure-Data as a WYSIWYG editor for interfaces. This program distributed here will parse the pd patch to create the rigthfull gui elements through controlP5.

As a user you would essentially care for :
- osc_controller_template : to launch/create desktop applications.
- osc_crontroller_template_android : to launch/create android applications.
- any example beginning with "receiver" depending on where you want the data.

## How to run ?
- create a pd patch with gui elements
- open the processing template and save it somewhere
- drop the pd patch containing the interface on the processing window.
- on top of the program you should see this line :
    ```java
    String[] pages = {"Settings", "test"}; // name of the pd patch to use as layout
    ```
    you can edit it to add the name of the pd file you just dropped on the processing window (minus the ".pd"), you can create several interfaces by creating multiple pd patches and adding several names to this line. Each interface will be in a seperate tab named after the name of your patch.
- click run (you should see a replicate of the interface you built but with osc networking options)

- (optionally) run in android-mode to get an android app.

## What should be supported ?

* [x] buttons
* [x] toggles
* [x] horizontal sliders
* [x] vertical sliders
* [x] horizontal radio button
* [x] vertical radio button
* [x] 2d-pad
* [x] color selector
* [x] text

* [x] support multiple screen sizes
* [x] edit multiple page layouts
* [x] customize colors
* [ ] specific android version with sensors data and fixes (like keyboard popping in textfields)
    * [x] keyboard pop when needed
    * [x] audio input
    * [ ] 


## Software dependencies

- OSCP5 lib for processing
- android mode for processing (optional - for android)
- ketai for android (optional - for android)


## What is OSC ?

## What is Pure-data ?

## How to build an interface with Pure-Data ?

## Anrdoid How-to