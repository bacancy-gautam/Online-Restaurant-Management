


$(document).ready(function(){

$input = $("[data-behavior='autocomplete-1']")
$input2 = $("[data-behavior='autocomplete-2']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?term=" + phrase;
    },
    categories: [
      {
        listLocation: "restaurants",
        header: "<center><strong> -- RESTAURANTS -- </strong></center>",
      },
      {
        listLocation: "fooditems",
        header: "<center><strong> -- DISHES -- </strong></center>",
      }
    ],
    list: {
      onChooseEvent: function( ) {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

var options2 = {
    getValue: "name",
    url: function(phrase) {
      return "/location.json?loc=" + phrase;
    },
    categories: [
      {
        listLocation: "addresses",
        header: "<strong> -- Places -- </strong>",
      }
    ],
    list: {
      onChooseEvent: function( ) {
        var url = $input2.getSelectedItemData().url
        $input2.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options);
  $input2.easyAutocomplete(options2);

});
