
//     //Hiding Logo once user scrolls down to provide a better viewing experience
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


// window.onload(function changePhotoHeight () {
//     var pageHeight = jQuery(window).height();
//     var pageWidth = jQuery(window).width();

//     if (pageWidth>768) {
//         var photoHeight = pageHeight-50;
//         var photoWidth = photoHeight*3/2;
//         console.log(photoWidth);
        
//         $('.photograph').css({ "max-height": photoHeight + 'px' });
//     }
//   });

//   //window.onload = changePhotoHeight;

//   $("body").on("contextmenu", ".article-body, .photograph-group img", function(e) {
//   return false;



//     //Toggling Menu



//     $(".toggle").click(function(){
//         $("#menu-section ul").slideToggle();
//     });

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
//         else if ($('#lightbox').css("display")=="")
//         {
//             //$('#menu-section ul').fadeIn();

//             if  ($(window).scrollTop()<400)
//                 $('#nav-section .logo').fadeIn();

//             $('.keyboard-instructions').text("press 'L' to turn OFF lights");
//             $('#nav-section .keyboard-instructions').fadeIn();
//             $('#lightbox').fadeOut();
//         }

//         break;

//         case 9:
//         break;

//         case 37: // left
//         break;

//         case 38: // up
//         break;

//         case 39: // right
//         break;

//         case 40: // down
//         break;

//         case 44 //Print Screen
//         break;

//         default: return; // exit this handler for other keys
//     }
//     e.preventDefault(); // prevent the default action (scroll / move caret)

// });




// // $(function() {
// //   initPage();
// // });
// // $(window).bind('page:change', function() {
// //   initPage();
// // });