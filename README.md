# Godot COI Service Worker

This plugin makes use of the [coi-serviceworker](https://github.com/gzuidhof/coi-serviceworker) Javascript library to enable cross-origin isolation in Godot 4 games for situations in which you can't control the headers. In other words, it fixes the SharedArrayBuffer error.

See also [this Godot proposal](https://github.com/godotengine/godot-proposals/issues/6616).

## Important Note

If your web host allows you to set the proper headers, you should do that instead. For example, [itch.io](https://itch.io) and [Newgrounds](https://www.newgrounds.com) both have options to enable this feature (refered to as enabling SharedArrayBuffer support). You should only use this plugin if you are unable to configure the headers.

## Usage

Simply install this plugin and enable it in your project settings. When you export a Web build, the plugin will add the Javascript file to enable this feature. This script will reload the page on the user's first load to magically add the required COOP and COEP headers in a service worker. See the [coi-serviceworker](https://github.com/gzuidhof/coi-serviceworker) project page for more information.

## Limitations

There is a good chance that any host that embeds your game in an iframe within another page will still not work with this addon. If you were to open that embedded page into its own tab, it will probably work, but while it is embedded it won't.
