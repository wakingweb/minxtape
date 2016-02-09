document.addEventListener 'DOMContentLoaded', ->

  # make tracks sortable
  el = document.getElementById('nested-tracks-form')
  if el
    sortable = Sortable.create el,
      handle: '.fi-list'
      animation: 150

  [].forEach.call document.getElementsByClassName('minxtape-track'), (v,i,a) ->
    # on play, hide/show current track indicator
    v.addEventListener 'play', ->
      currentPosition = parseInt(this.dataset.position)
      currentTrackIndicator = document.getElementById("minxtape-track-indicator-#{currentPosition}")
      currentTrackIndicator.style.display = ''
      prevPosition = parseInt(this.dataset.position) - 1
      prevTrackIndicator = document.getElementById("minxtape-track-indicator-#{prevPosition}")
      if prevTrackIndicator
        prevTrackIndicator.style.display = 'none'
    # autoplay next track when current audio is ended
    v.addEventListener 'ended', ->
      nextPosition = parseInt(this.dataset.position) + 1
      nextTrack = document.getElementById("minxtape-track-#{nextPosition}")
      if nextTrack
        this.style.display = 'none'
        nextTrack.style.display = ''
        nextTrack.play()

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
