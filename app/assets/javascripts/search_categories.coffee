$(".multiselect").multiselect
  noneSelectedText: 'Select gene categories'
  selectedText: '# of #'
  minWidth: 400
.multiselectfilter()

$(".multiselect").multiselect("checkAll")

$('#loadingBar').show()
$.get '/gene_group_names.json', (data)->
  $('#genes').typeahead
    source: data
    items: 20
    updater: (item)->
      oldval = this.$element[0]?.value?.split("\n")[0..-2].join("\n")
      (if oldval then oldval + "\n" else ""  ) + item + "\n"
  $('#loadingBar').hide()

$('#defaultGenes').click ->
    $('#genes')[0].value = ['HER2', 'ERBB2', 'PTGDR', 'EGFR', 'RECK', 'KCNMA1', 'MM1', 'LOC100508755', 'FAKE1'].join "\n"
    $('#genes')[0].value += "\n"

$('#clear').click ->
    $('#genes')[0].value = []

$(".btn-primary").click ->
  $("#loading").modal("show") if $("#html_output").attr('checked')

$(window).unload ->
  $("#loading").modal("hide")

$.valHooks.textarea =
    get: (elem) -> elem.value.replace(/(\n|\r)+$/,"").split("\n").splice(-1,1)[0]

$("#genes").focus()