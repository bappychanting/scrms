// v3.1.0
//Docs at http://simpleweatherjs.com

// Original Script
/*
$(document).ready(function() {
  $.simpleWeather({
    location: 'Dhaka, Bangladesh',
    woeid: '',
    unit: 'f',
    success: function(weather) {
      html = '<h2><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h2>';
      html += '<ul><li>'+weather.city+', '+weather.region+'</li>';
      html += '<li class="currently">'+weather.currently+'</li>';
      html += '<li>'+weather.wind.direction+' '+weather.wind.speed+' '+weather.units.speed+'</li></ul>';
  
      $("#weather").html(html);
    },
    error: function(error) {
      $("#weather").html('<p>'+error+'</p>');
    }
  });
});
*/



// Customized Script

$(document).ready(function() {
  $.simpleWeather({
    location: 'Dhaka, Bangladesh',
    woeid: '',
    unit: 'c',
    success: function(weather) {
      $("#icon").append('<i class="icon-'+weather.code+'"></i> ');
      $("#temperature").append(weather.temp+'&deg;'+weather.units.temp);
      $("#condition").append(weather.currently);
      $("#air").append(weather.wind.direction+' '+weather.wind.speed+' '+weather.units.speed);
    },
    error: function(error) {
      $("#weather").append(error);
    }
  });
});