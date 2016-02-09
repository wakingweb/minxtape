document.addEventListener 'DOMContentLoaded', ->

  # make tracks sortable
  el = document.getElementById('nested-tracks-form')
  if el
    sortable = Sortable.create el,
      handle: '.fi-list'
      animation: 150

  # autoplay next track when current audio is ended
  [].forEach.call document.getElementsByClassName('minxtape-track'), (v,i,a) ->
    v.addEventListener 'ended', ->
      nextPosition = parseInt(this.dataset.position) + 1
      nextTrack = document.querySelector("#minxtape-track-#{nextPosition} audio")
      if nextTrack
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
