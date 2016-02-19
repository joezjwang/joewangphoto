  $(window).scroll(function() {
        var height = $(window).scrollTop();
        if (height>400)
        {
            //console.log(height);
            $("#nav-section .logo").fadeOut();
        }
        else
        {
            if ($('#nav-section .copyright').css("display")=="block")
                $("#nav-section .logo").fadeIn();
        }

    });
// $( document ).ready(function() {
//     $(".collection-photo").mouseover(function(){
//     console.log("mouseover");
//     $(".photo-text-container").fadeIn();
//     });
//     $(".collection-photo").mouseout(function(){
//     $(".photo-text-container").fadeOut();
//     });
// });


    // function scrollToAnchor(aid){
    //     var aTag = $("a[name='"+ aid +"']");
    //     $('html,body').animate({scrollTop: aTag.offset().top},'slow');
    // }

$(document).keydown(function(e) {

      switch(e.which) {
        case 76: // L key

        if ($('#lightbox').css("display")=="none"){
            $('#lightbox').fadeIn();
            //$('#menu-section ul').fadeOut();
            $('#nav-section .logo').fadeOut();
            $('.keyboard-instructions').text("press 'L' to turn ON lights");

        }
        else if ($('#nav-section').css("display")=="block")
        {
            //console.log($('#lightbox').css("display"));
            $('#menu-section ul').fadeIn();

            if  ($(window).scrollTop()<400)
                $('#nav-section .logo').fadeIn();

            $('.keyboard-instructions').text("press 'L' to turn OFF lights");
            $('#nav-section .keyboard-instructions').fadeIn();
            $('#lightbox').fadeOut();
        }
        break;

        case 37: // left
        break;

        case 38: // up
        break;

        case 39: // right
        break;

        case 40: // down
        break;

        default: return; // exit this handler for other keys
    }
    e.preventDefault(); // prevent the default action (scroll / move caret)

});



$(".toggle").click(function(){
    $("#menu-section ul").slideToggle();
});


function changePhotoHeight () {
    pageHeight = jQuery(window).height();
    pageWidth = jQuery(window).width();

    if (pageWidth>899) {
        var photoHeight = pageHeight-50;
        var photoWidth = photoHeight*3/2;
        console.log(photoWidth);
        
        $('.photograph').css({ "max-height": photoHeight + 'px' });
    }
  }

  window.onload = changePhotoHeight;




// $(function() {

//     $(window).scroll(function() {
//         var height = $(window).scrollTop();
//         if (height>400)
//         {
//             //console.log(height);
//             $("#nav-section .logo").fadeOut();
//         }
//         else
//         {
//             if ($('#nav-section .copyright').css("display")=="block")
//                 $("#nav-section .logo").fadeIn();
//         }

//     });
//   });
// // $( document ).ready(function() {
// //     $(".collection-photo").mouseover(function(){
// //     console.log("mouseover");
// //     $(".photo-text-container").fadeIn();
// //     });
// //     $(".collection-photo").mouseout(function(){
// //     $(".photo-text-container").fadeOut();
// //     });
// // });


//     // function scrollToAnchor(aid){
//     //     var aTag = $("a[name='"+ aid +"']");
//     //     $('html,body').animate({scrollTop: aTag.offset().top},'slow');
//     // }

// $(document).keydown(function(e) {

//       switch(e.which) {
//         case 76: // L key

//         if ($('#lightbox').css("display")=="none"){
//             $('#lightbox').fadeIn();
//             //$('#menu-section ul').fadeOut();
//             $('#nav-section .logo').fadeOut();
//             $('.keyboard-instructions').text("press 'L' to turn ON lights");

//         }
//         else if ($('#nav-section').css("display")=="block")
//         {
//             //console.log($('#lightbox').css("display"));
//             $('#menu-section ul').fadeIn();

//             if  ($(window).scrollTop()<400)
//                 $('#nav-section .logo').fadeIn();

//             $('.keyboard-instructions').text("press 'L' to turn OFF lights");
//             $('#nav-section .keyboard-instructions').fadeIn();
//             $('#lightbox').fadeOut();
//         }
//         break;

//         case 37: // left
//         break;

//         case 38: // up
//         break;

//         case 39: // right
//         break;

//         case 40: // down
//         break;

//         default: return; // exit this handler for other keys
//     }
//     e.preventDefault(); // prevent the default action (scroll / move caret)

// });



// $(".toggle").click(function(){
//     $("#menu-section ul").slideToggle();
// });


//     var pageHeight = jQuery(window).height();
//     var pageWidth = jQuery(window).width();

//     if (pageWidth>768) {
//         var photoHeight = pageHeight-50;
//         var photoWidth = photoHeight*3/2;
//         //console.log(photoWidth);
        
//         $('.collection-photo').css({ "max-height": photoHeight + 'px' });
//         //$('.collection-photo').css({ "width": photoWidth + 'px' });
//     }

