(->
  class Filter
    availability: ->
      $('#both_status').click ->
        $('#procurable_item').val 0
        $('#unprocurable_item').val 0
        return
      $('#procurable').click ->
        $('#procurable_item').val 1
        $('#unprocurable_item').val 0
        return
      $('#unprocurable').click ->
        $('#procurable_item').val 0
        $('#unprocurable_item').val 1
        return

  window.Filter=new Filter()
).call this
