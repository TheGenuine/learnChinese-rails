# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#add_word_button').click ->
	$('#add_word_row').toggle()

$('#add_concept_button').click ->
	$('#addConceptDialog').modal "show"

$("#button_add_selected_concept").click ->
  lesson_concepts = $("#lesson_concept")
  all_concepts = $("#allConcepts_concept_id")
  $("#allConcepts_concept_id option:selected").each ->
  	value = $(this).attr 'value';
  	lesson_concepts.append "<option value='" + value + "'>" + $(this).text() + "</option>";
	# all_concepts.remove "[value='" + value + "']";

$('#button_remove_selected_concept').click ->
