// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap/modal
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require bootstrap.min
//= require popper
//= require turbolinks
//= require jquery
//= require jquery.easy-autocomplete
//= require_tree .
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
        header: "<strong> -- RESTAURANTS -- </strong>",
      },
      {
        listLocation: "fooditems",
        header: "<strong> -- DISHES -- </strong>",
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
