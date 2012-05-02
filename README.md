# Omnidirectional Video Player - basic

## Description

ActionScript3 implementation of an Omnidirectional (360°) Video Player, based on the [Away3D](http://away3d.com/) 4.0.0 beta framework.

A sphere surrounds the user and is textured with frames from an equirectangular video. The main classes for loading the panoramic video onto a sphere and navigating in it are visuall.ovp.PanoSphere and visuall.ovp.PanoVideoNav, respectively.


## Compiling

* Download the [Away3D sources](http://away3d.com/images/uploads/releases/away3d-core-fp11_4_0_0_beta.zip) and include them to your project's build path.
* Follow [these instructions](http://www.rivellomultimediaconsulting.com/setup-flash-builder-for-air-3-2-stage3d-for-ios-android/) to install the latest SDK (with AIR 3.2) in Flash Builder 4.6
* When using Away3D 4.0.0 beta, make sure you include "-swf-version=15" in the compiler arguments.
* For this project, you also want to indicate to the compiler whether you want the debug config or not: "-define CONFIG::DEBUG true".


## Follow us

We are on twitter: [@visuallinteract](http://twitter.com/visuallinteract).

Follow us for all news related to our work on 360° videos and virtual tours. Visu'all Interactive is the R&D branch of Concept Immo Global, a Paris-based startup.


## Ideas for future work

 * Handle window resizing and full screen
 * Show wireframe sphere for debug (no use showing a trident)?
 * Use StageVideo? -> to be done in away3d.materials.utils.SimpleVideoPlayer
 * Make changes to away3d.textures.VideoTexture.update() in order to improve performance: do not copy bitmapdata if _currentTime - _lastTime >= _frameInterval. This is useful when the framerate of the video is lower than the framerate specified for the flash stage.


## Copyright & license

This code is distributed under a GPL v3.0 License. See http://www.gnu.org/licenses/gpl.html for more information. Copyright © [Concept Immo Global](http://www.concept-immo-global.com/), 2012.