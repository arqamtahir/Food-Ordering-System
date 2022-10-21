(->
  class FoodItem
    select_change: ->
      console.log("running")
      $(".category_select").change ->
        group_item_id = $(".category_select").val()
        console.log group_item_id
        $.ajax
          type: 'GET'
          url: '/select_option'
          dataType: 'script'
          data:
            group_item_id: group_item_id
        return
      return

  window.foodItem = new FoodItem()
).call this
