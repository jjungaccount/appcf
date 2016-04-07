$(document).on('ready page:load', function(){
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]', enable_half: true });
  $('.rated').raty( { path: '/assets', 
    readOnly: true, 
    score: function(){
      return $(this).attr('data-score');
    }
  });
  $('.img-zoom').elevateZoom({ 
    zoomWindowPosition: 5,
    zoomWindowFadeIn: 500, 
    zoomWindowFadeOut: 500, 
    lensFadeIn: 500, 
    lensFadeOut: 500,
    zoomWindowWidth: 300, 
    zoomWindowHeight: 250 });
});

