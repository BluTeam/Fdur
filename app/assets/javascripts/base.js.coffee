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

