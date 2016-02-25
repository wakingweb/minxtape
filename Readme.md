# MinxTape <sup>[http://minxtape.com](http://minxtape.com)</sup>

MinxTape is a new way to share music in the cloud by creating mix tapes from your own files. This project was initially inspired by the old [Muxtape](http://muxtape.tumblr.com/) project. I loved it's simplicity, and I found myself missing a way to share music compilations with other people. Especially when you want to use songs that are not available on streaming services.

## Architecture

* Heroku
* Rails 4
* Foundation 6
* Devise
* Carrierwave/Fog/S3
* HTML5 audio

## Features

* create mixes by uploading files (mp3/m4a/ogg)
* drag-and-drop re-orderding of songs
* upload album art (mix tape background)
* skip to song by clicking on song title
* facebook authentication

## Future Plans

Here are some high priority improvements I'm working on:

* Global play/pause/volume control, hide html5 audio components
* Auto-fill "Song - Artists" from  uploaded file metadata

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
