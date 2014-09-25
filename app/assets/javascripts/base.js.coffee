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

