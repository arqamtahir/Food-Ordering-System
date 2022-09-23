$(document).ready(function() {    
  dealSwitcher = function(){
    var deal = document.getElementById("deal");
    var grpItem = document.getElementById("grp-item");
    deal.classList.remove("d-none");
    grpItem.classList.add("d-none");
  }

  groupItemSwitcher = function(){
    var deal = document.getElementById("deal");
    var grpItem = document.getElementById("grp-item");
    grpItem.classList.remove("d-none");
    deal.classList.add("d-none");
  }
});
