# Godot COI Service Worker

This plugin makes use of the [coi-serviceworker](https://github.com/gzuidhof/coi-serviceworker) Javascript library to enable cross-origin isolation in Godot 4 games for situations in which you can't control the headers. In other words, it fixes the SharedArrayBuffer error.

See also [this Godot proposal](https://github.com/godotengine/godot-proposals/issues/6616).

## Important Note

If your web host allows you to set the proper headers, you should do that instead. For example, [itch.io](https://itch.io) and [Newgrounds](https://www.newgrounds.com) both have options to enable this feature (refered to as enabling SharedArrayBuffer support). You should only use this plugin if you are unable to configure the headers.

## Usage

Simply install this plugin and enable it in your project settings. When you export a Web build, the plugin will add the Javascript file to enable this feature. This script will reload the page on the user's first load to magically add the required COOP and COEP headers in a service worker. See the [coi-serviceworker](https://github.com/gzuidhof/coi-serviceworker) project page for more information.

## Export Options

* Include Coi Service Worker - Whether to include the service worker. On by default, and you probably want this left on since that's the core of this addon.
* Iframe Breakout - If enabled, it will generate an index.html file that only has a button to open the game outside of the iframe it starts in. This can help on hosts that put the game in an iframe, since that often will not work. In order to use this feature, you _must not_ export your game as index.html.

## Limitations

There is a good chance that any host that embeds your game in an iframe within another page will still not work with this addon. If you were to open that embedded page into its own tab, it will probably work, but while it is embedded it won't. You can use the export option mentioned above to break out of the iframe.

## Version History

### v1.1

* Now hides the SharedArrayBuffer error message on the intial load, before the service worker is loaded
* Added export options "Include Coi Service Worker" and "Iframe Breakout"
* Updated coi-serviceworker.min.js to v0.1.7

### v1.0

* Initial release
