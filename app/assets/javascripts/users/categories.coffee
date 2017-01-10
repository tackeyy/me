window.Me ||= {}

class Me.UserCategories
  constructor: ->
    $searchble = $(".searchable")
    return if $searchble.length == 0
    $searchble.select2({
      placeholder: 'フォルダを選択してください',
    })

$ ->
  new window.Me.UserCategories()
