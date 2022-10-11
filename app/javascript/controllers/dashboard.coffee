(->
  class Dashboard
    select_change: ->
      $(document).ready ->
        $('#food_item_group_item_id2').parent().hide()
        options = $('#food_item_group_item_id2').html()
        # console.log options
        $('#food_item_group_item_id').change ->
          group_item = $('#food_item_group_item_id :selected').text()
          # console.log $('#food_item_group_item_id :selected')
          select_option = $(options).filter("optgroup[label='#{group_item}']").html()
          # console.log select_option
          if select_option
            $('#food_item_group_item_id2').html(select_option)
            $('#food_item_group_item_id2').parent().show()
          else
            $('#food_item_group_item_id2').empty()
            $('#food_item_group_item_id2').parent().hide()
        return

  window.dashboard = new Dashboard()
).call this
