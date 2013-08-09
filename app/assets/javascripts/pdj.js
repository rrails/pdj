var map;
var canvas;
var markers = [];

var display_map = function (lat, long, zoom) {

  canvas = $('#map_canvas')[0];

  if (! canvas)
    return; // I QUIT

  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(canvas, mapOptions);
};

  var center_map = function (lat,long,zoom){
    var latlong = new google.maps.LatLng(lat, long);
    map.setCenter(latlong);
  }


  var add_marker = function (lat, long, title, icon, cuisine) { //function is called via a script inside the restaurants controller inside of a each loop on plats available that day
  var latlng = new google.maps.LatLng(lat, long);
  var options = { //an object to store the data
    position: latlng,
    map: map,
    title: title,
    cuisine: cuisine
  };
  if (icon) {
    options.icon = icon;
  }
  var marker = new google.maps.Marker(options); //options passes the values into marker here
  marker.setVisible(true);
  markers.push(marker); //push each marker into the global markers array

};


$(document).ready(function () {
  display_map(-33.89336, 151.217167, 13);
});



