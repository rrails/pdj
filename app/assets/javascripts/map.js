$(document).ready(function () {

var show_cuisine = function() {

    var   $cuisine = $(this).attr('id'); //defines the cuisine variable based on the id of the checkbox that is ticked
    var show = $(this).is(':checked'); //define a show method that is true when checked

    $.each(markers, function (i, marker) { //iterate over the markers array on each marker
      if (marker.cuisine == $cuisine) //if the cuisine of each marker equals cuisine (which is what is clicked on), then setVisible
        marker.setVisible(show); //setVisible relies on the variable show which will be true(displayed) when a checkbox is clicked on
    });

    //console.log('toggling for selector', '#rest_list .' + $cuisine);
    $('#rest_list .' + $cuisine).toggle();

};

$('.show_cuisine').on('change', show_cuisine); //change event on the classed checkbox

});

