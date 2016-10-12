$ ->
  ms = $('#js-magicsuggest').magicSuggest
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
