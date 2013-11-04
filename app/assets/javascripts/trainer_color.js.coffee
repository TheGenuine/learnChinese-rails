question_no = 1
answers_correct = 0
current_number = 0
user_input = "0"
modes =
  COLOR_TO_PYNIN: 0
  CHAR_TO_COLOR: 1

mode = 1

color = [
  pinyin: "hei"
  character: "黑"
  translation: "black"
  color: "#000000"
,
  pinyin: "bai"
  character: "白"
  translation: "white"
  color: "#FFFFFF"
,
  pinyin: "hong"
  character: "红"
  translation: "red"
  color: "#FF0000"
,
  pinyin: "lu"
  character: "绿"
  translation: "green"
  color: "#008000"
,
  pinyin: "lan"
  character: "蓝"
  translation: "blue"
  color: "#0000FF"
,
  pinyin: "huang"
  character: "黄"
  translation: "yellow"
  color: "#FFFF00"
,
  pinyin: "zi"
  character: "紫"
  translation: "purple"
  color: "#800080"
,
  pinyin: "fen"
  character: "粉"
  translation: "pink"
  color: "#FFC0CB"
,
  pinyin: "hui"
  character: "灰"
  translation: "gray"
  color: "#808080"
,
  pinyin: "zong"
  character: "粽"
  translation: "brown"
  color: "#8B4513"
,
  pinyin: "cheng"
  character: "橙"
  translation: "orange"
  color: "#FFA500"
]

check = ->
  
  switch mode
    when modes.COLOR_TO_PYNIN
      if user_input.trim() is color[current_number].character or user_input.trim() is color[current_number].pinyin
        correct()
      else
        wrong()
    when modes.CHAR_TO_COLOR
      if parseInt(user_input.attr("id")) is current_number
        correct()
      else
        wrong()

  if question_no is 10
    if answers_correct > 5
      message = "<h2>Great Job!<br><br>" + answers_correct + " out of 10</h2>"
    else
      message = "<h2>I'm sure you can do better<br><br>" + answers_correct + " out of 10</h2>"
    $("#dialog_message").empty()
    $("#dialog_message").html message
    $("#finishedDialog").modal "show"
  else
    nextQuestion()

correct = ->
  $("#progress").append "<div class='progress-bar progress-bar-success' style='width: 10%;'></div>"
  answers_correct++

wrong = ->
  $("#progress").append "<div class='progress-bar progress-bar-danger' style='width: 10%;'></div>"

resetGame = ->
  $("#progress").empty()
  question_no = 1
  answers_correct = 0
  nextQuestion()
  $("#finishedDialog").modal "hide"

nextQuestion = ->
  question_no++
  selectMode()
  generateColor()
  setupLayout()

generateColor = ->
  current_number = Math.floor(Math.random() * 10)
  console.log color[current_number]

# setupColorFields = ->
#   color_field_container = $("#user_input_field")
#   i = 0

#   while i < color.length
#     item = color[i]
#     color_field_container.append "<div class='col-xs-2'><div class='img-rounded color-field' id='" + i + "' style='background-color: " +  item.color + ";'/></div>"
#     if i == 4 
#       color_field_container.append "<br>"
#     i++

setupLayout = ->
  $("#description").empty()
  $("#question").empty()
  switch mode 
    when modes.COLOR_TO_PYNIN
      $("#checkButton").show()
      $("#color_fields").hide()
      $("#user_input_text").show()
      $("#user_input_text").val ""
      $("#description").html "<h4>Type in the character or pynin of the color shown on the left</h4>"
      $("#question").html "<div class='img-rounded' style='width: 80px; height: 80px; background-color: " + color[current_number].color + "'></div>"
    
    when modes.CHAR_TO_COLOR
      $("#checkButton").hide()
      $("#user_input_text").hide()
      $("#color_fields").show()
      $("#question").html "<h1>" + color[current_number].character + "</h1>"
      $("#description").html "<h4>Choose the right color</h4>"
 
selectMode = ->
  mode = Math.floor(Math.random() * 2)
  console.log "Current mode " + mode

init = ->
  selectMode()
  generateColor()
  setupLayout()
  
init()

$("#closeButton").click ->
  window.location.replace "/"

$("#finishedDialog").on "hidden.bs.modal", ->
  resetGame()

$(".color-field").click ->
  user_input = $(this)
  check()

$("#againButton").click resetGame
$("#checkButton").click ->
  user_input = $("#user_input_text").val()
  check()
$("#user_input_text").keypress (e) ->
  if e.which is 13
    user_input = $("#user_input_text").val()
    check()
