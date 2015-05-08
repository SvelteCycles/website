// $(document).ready(function() {
//
//    $(".mailing-list").on("click", function(e) {
//      e.preventDefault();
//      $(".mailing-list-input").fadeToggle("slow");
//    });
//
//    $(".mailing-list-input").keyup(function(e) {
//      if (e.keyCode == 27) {
//        $(".mailing-list-input").fadeOut(400);
//      } else if (e.keyCode == 13) {
//        $(".mailing-list-input").fadeOut(400);
//        $(".mailing-confirm").fadeIn(400).delay(3000).fadeOut(400);
//      }
//    });
//
//   //  $(".mailing-list-btn").on("click", function(e) {
//   //    e.preventDefault();
//   //    $(".mailing-list-input").fadeOut(400);
//   //    $(".mailing-confirm").fadeIn(400).delay(3000).fadeOut(400);
//   //  });
//
//    $(".mailing-list-input").submit(function() {
//      validateEmail($('input').val())
//    })
//
//    function validateEmail(email) {
//      var reg = /^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/;
//
//      if (reg.test(email)) {
//      } else {
//      }
//    }
//
//    function signUpAnimate() {
//      $(".mailing-list-input").fadeOut(400);
//      $(".mailing-confirm").fadeIn(400).delay(3000).fadeOut(400);
//    }
//
// });
