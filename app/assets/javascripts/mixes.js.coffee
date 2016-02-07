document.addEventListener 'DOMContentLoaded', ->

  el = document.getElementById('nested-tracks-form')
  if el
    sortable = Sortable.create el,
      handle: '.fi-list'
      animation: 150

  [].forEach.call document.getElementsByClassName('minxtape-track'), (v,i,a) ->
    v.addEventListener 'ended', ->
      nextPosition = parseInt(this.dataset.position) + 1
      nextTrack = document.querySelector("#minxtape-track-#{nextPosition} audio")
      if nextTrack
        nextTrack.play()
