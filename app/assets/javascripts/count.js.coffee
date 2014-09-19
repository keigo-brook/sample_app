$ ->
  countMax = 140
  $(".textarea").bind "keydown keyup keypress change", ->
    thisValueLength = $(this).val().length
    countDown = (countMax) - (thisValueLength)
    $(".count").html countDown
    if countDown < 0
      $(".count").css
        color: "#ff0000"
        fontWeight: "bold"

    else
      $(".count").css
        color: "#000000"
        fontWeight: "normal"

    return

  $(window).load ->
    $(".count").html countMax
    return

  return
