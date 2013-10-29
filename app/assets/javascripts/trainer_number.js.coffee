# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
question_no = 1
answers_correct = 0
current_number = 0

# var characters = ["零", "一"， "二", "三", "四", "五", "六", "七", "八", "九", "十" ];
numbers_cn = ["ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu", "shi"]
current_state = 0
states =
  NUMBER_TO_PYNIN: 0
  CHAR_TO_NUMBER: 1

check = ->
  user_input = $("#userInput").val()
  switch current_state
    when states.NUMBER_TO_PYNIN
      correct_result = toPynin(current_number)
    when states.CHAR_TO_NUMBER
      correct_result = current_number
  if user_input.trim() is correct_result
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
  $("#userInput").val ""
  generateNumber()

generateNumber = ->
  current_number = Math.floor(Math.random() * 99)
  console.log(current_number)
  $("#number_field").html "<h3>" + current_number + "</h3>"

toCharacter = (number) ->
  characters[number]  if number <= 10

toPynin = (number) ->
  if number <= 19
    if number > 10
      "shi " + numbers_cn[number % 10]
    else
      numbers_cn[number]
  else
    num = number % 10
    result = numbers_cn[Math.floor(number / 10)] + " shi"
    result = result + " " + numbers_cn[num]  if num > 0
    result

generateNumber()
$("#closeButton").click ->
  window.location.replace "/"

$("#finishedDialog").on "hidden.bs.modal", ->
  resetGame()

$("#againButton").click resetGame
$("#checkButton").click check
$("#userInput").keypress (e) ->
  check()  if e.which is 13
