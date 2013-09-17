$(document).ready(function () {
 $('#search_submit').click(function() { //classed a button on restaurants page that has a click event to this function
    var search = $('#search_field').val(); //defined var search to the value input by the user inside the search box

    $.ajax({
        dataType: 'json',
        data: {
          'location': search //the data sent via ajax is in a hash so created a :location key for the search variable
        },
        type: 'post',
        url: '/search/', //change the routes to make this url go to the correct controller which is restaurants and create a method called search inside of it
      }).done(function(data) {
        var lat = data.latitude //the data we got is the variables we set in the controller
        var longi = data.longitude
     center_map(lat, longi) //call the display map function above which displays it with the lat and long we got from the controller
    });

});
});