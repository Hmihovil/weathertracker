<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Complex Polylines</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#floating-panel {
	position: absolute;
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="floating-panel">
		<input id="address" type="text" value="Sydney, NSW"> <input
			id="submit" type="button" value="Geocode">
	</div>
	<div id="map"></div>
	<script>

      // This example creates an interactive map which constructs a polyline based on
      // user clicks. Note that the polyline only appears once its path property
      // contains two LatLng coordinates.

      var poly;
      var map;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.879, lng: -87.624}  // Center the map on Chicago, USA.
        });

        poly = new google.maps.Polyline({
          strokeColor: '#000000',
          strokeOpacity: 1.0,
          strokeWeight: 3
        });
        poly.setMap(map);

        // Add a listener for the click event
        map.addListener('click', addLatLng);
        
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      }

      // Handles click events on a map, and adds a new point to the Polyline.
      function addLatLng(event) {
        var path = poly.getPath();

        // Because path is an MVCArray, we can simply append a new coordinate
        // and it will automatically appear.
        path.push(event.latLng);

        // Add a new marker at the new plotted point on the polyline.
        var marker = new google.maps.Marker({
          position: event.latLng,
          title: '#' + path.getLength(),
          map: map
        });
      }
      function geocodeAddress(geocoder, resultsMap) {
          var address = document.getElementById('address').value;
          geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK') {
              resultsMap.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                map: resultsMap,
                position: results[0].geometry.location
                
              });
              var path = poly.getPath();

              // Because path is an MVCArray, we can simply append a new coordinate
              // and it will automatically appear.
              path.push(event.latLng);

              // Add a new marker at the new plotted point on the polyline.
              var marker = new google.maps.Marker({
            	  position: results[0].geometry.location,
                title: '#' + path.getLength(),
                map: map
              });
            } else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
        }
    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYL5A6ZTQ3PxBGIJVFhyMvF3KunkTY0-Q&callback=initMap">
    </script>
</body>
</html>