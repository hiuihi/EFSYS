$(document).ready(function(){
    /*调起大图 S*/
     var mySwiper = new Swiper('.swiper-container2', {
          loop: false,
          pagination: '.swiper-pagination2',
          })
      $(".list").on("click", ".post img", 
      function() {
          var imgBox = $(this).parents(".post").find("img");
          var i = $(imgBox).index(this);
          $(".big_img .swiper-wrapper").html("")
  
          for(var j = 0 ,c = imgBox.length; j < c ;j++){
           $(".big_img .swiper-wrapper").append('<div class="swiper-slide"><div class="cell"><img src="' + imgBox.eq(j).attr("src") + '" / ></div></div>');
          }
          mySwiper.updateSlidesSize();
          mySwiper.updatePagination();
          $(".big_img").css({
              "z-index": 1001,
              "opacity": "1"
          });
          mySwiper.slideTo(i, 0, false);
          return false;
      });
    
      $(".big_img").on("click", 
      function() {
          $(this).css({
              "z-index": "-1",
              "opacity": "0"
          });
  
      });
    });
    /*调起大图 E*/