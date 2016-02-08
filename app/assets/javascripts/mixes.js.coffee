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

  # show uploader when track edit button clicked
  [].forEach.call document.getElementsByClassName('edit-mix-track-file'), (v,i,a) ->
    v.addEventListener 'click', (event) ->
      event.preventDefault()
      this.style.display = 'none'
      document.getElementById("mix-track-remove-#{this.dataset.target}").style.display = ''
      document.getElementById("mix-track-file-#{this.dataset.target}").style.display = ''
