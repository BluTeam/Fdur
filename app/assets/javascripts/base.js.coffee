$(document).ready ->
  setTimeout ->
    $('#flash_message').slideUp()
  , 5000

  $('#flash_message').click ->
    $(this).slideUp()

# get request params

  window.getParams = (url = window.location.href) ->
    qs = url.split('?').pop().split('&');
    qso = {}
    for qsn in qs
      if qsn==""
        continue
      tmpa = qsn.split("=")
      qso[tmpa[0]] = (tmpa[1] if tmpa[1])
    return qso

# Tags

  $('.Tags').click ->
    $('.Tags').removeClass('Tag-selected')
    $('.Tags-content').removeClass('Tag-show')
    flag = $(this).attr('data-flag')
    $(flag).addClass('Tag-show')
    $('a[data-flag=' + flag + ']').addClass('Tag-selected')

# newTags

  $('.newTags').click ->
    $('.newTags').removeClass('newTag-selected')
    $('.newTags-content').removeClass('newTag-show')
    flag = $(this).attr('data-flag')
    $(flag).addClass('newTag-show')
    $('a[data-flag=' + flag + ']').addClass('newTag-selected')

# project_follow

  $('#followProject').on 'click',() ->
    button = $(this)
    button.attr "disabled", "true"
    project_id = button.attr "data-project-id"
    p_url = '/projects/'+project_id+'/follow'
    $.ajax(
      url: p_url,
      type: 'POST',
      dataType: 'json',
      success: (result) ->
        console.log("1")
        $('#followedCount').text(result.count)
        if result.flag == "add"
          button.addClass("followed")
        else if result.flag == "remove"
          button.removeClass("followed")
    )