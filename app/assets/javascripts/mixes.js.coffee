document.addEventListener 'DOMContentLoaded', ->

  el = document.getElementById('nested-tracks-form')
  sortable = Sortable.create el,
    handle: '.fi-list'
    animation: 150
