window.Me ||= {}

class Me.UserPosts
  constructor: ->
    $magicSuggest = $('#js-tag-magicsuggest')
    return if $magicSuggest.length == 0

    ms = $magicSuggest.magicSuggest
      required: true,
      useTabKey: true,
      autoSelect: true,
      placeholder: 'タグを入力'

    $(ms).on('load'
      $.ajax
        medhod: 'GET'
        url: '/users/tag/list'
        dataType: 'json',
        success: (data) ->
          ms.setData(data)
    )

$ ->
  new window.Me.UserPosts()
