document.addEventListener 'DOMContentLoaded', ->

  # make tracks sortable
  el = document.getElementById('nested-tracks-form')
  if el
    sortable = Sortable.create el,
      handle: '.fi-list'
      animation: 150

  # minxtape player
  el = document.getElementById("minxtape-player")
  if el
    # load and play next track when playback of current track ends
    el.addEventListener 'ended', ->
      nextPosition = parseInt(this.dataset.position) + 1
      nextTrack = document.getElementById("minxtape-track-#{nextPosition}")
      this.children[0].src = nextTrack.dataset.source
      this.dataset.position = nextPosition
      this.load()
      this.play()
    # update current track indicator
    el.addEventListener 'play', ->
      currentPosition = parseInt(this.dataset.position)
      currentTrackIndicator = document.getElementById("minxtape-track-indicator-#{currentPosition}")
      currentTrackIndicator.style.display = ''
      prevPosition = parseInt(this.dataset.position) - 1
      prevTrackIndicator = document.getElementById("minxtape-track-indicator-#{prevPosition}")
      if prevTrackIndicator
        prevTrackIndicator.style.display = 'none'

    # when track is clicked, play track
    [].forEach.call document.getElementsByClassName('trigger-track'), (v,i,a) ->
      v.addEventListener 'click', (event) ->
        event.preventDefault()
        this.style.display = 'none'
        document.getElementById("cancel-edit-audio-file-#{this.dataset.target}").style.display = ''
        document.getElementById("audio-file-#{this.dataset.target}").style.display = ''

  # show audio uploader when track edit button clicked
  [].forEach.call document.getElementsByClassName('edit-audio-file'), (v,i,a) ->
    v.addEventListener 'click', (event) ->
      event.preventDefault()
      this.style.display = 'none'
      document.getElementById("cancel-edit-audio-file-#{this.dataset.target}").style.display = ''
      document.getElementById("audio-file-#{this.dataset.target}").style.display = ''

  # hide audio uploader when track edit "Cancel" button clicked
  [].forEach.call document.getElementsByClassName('cancel-edit-audio-file'), (v,i,a) ->
    v.addEventListener 'click', (event) ->
      event.preventDefault()
      this.style.display = 'none'
      document.getElementById("edit-audio-file-#{this.dataset.target}").style.display = ''
      document.getElementById("audio-file-#{this.dataset.target}").style.display = 'none'
