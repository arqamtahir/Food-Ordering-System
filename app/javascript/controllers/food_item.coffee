# (->
#   class Dashboard
#     select_change: ->
#       $(document).ready ->
#         console.log("DOM is ready")
#         $('#food_item_option_id').parent().hide()
#         options = $('#food_item_option_id').html()
#         console.log options
#         $('#food_item_group_item_id').change ->
#           group_item = $('#food_item_group_item_id :selected').text()
#           console.log $('#food_item_group_item_id :selected').text()
#           select_option = $(options).filter("optgroup[label='#{group_item}']").html()
#           console.log select_option
#           if select_option
#             $('#food_item_option_id').html(select_option)
#             $('#food_item_option_id').parent().show()
#           else
#             $('#food_item_option_id').empty()
#             $('#food_item_option_id').parent().hide()
#         return

#   window.dashboard = new Dashboard()
# ).call this

(->
  class FoodItem
    select_change: ->
      console.log("running")
      $(".category_select").change ->
        group_item_id = $(".category_select").val()
        from_id = $('#food_item_form')
        console.log group_item_id
        $.ajax
          type: 'GET'
          url: '/select_option'
          dataType: 'script'
          data:
            group_item_id: group_item_id
            from_id: from_id
        return
      return

  window.food_item = new FoodItem()
).call this

