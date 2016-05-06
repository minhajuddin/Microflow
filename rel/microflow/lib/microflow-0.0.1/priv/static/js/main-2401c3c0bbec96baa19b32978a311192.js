 function showloader() {
        // add the overlay with loading image to the page
        var over = '<div id="overlay">' +
            '<div class="loading">'+
  '<div class="loading-bar"></div>'+
  '<div class="loading-bar"></div>'+
  '<div class="loading-bar"></div>'+
  '<div class="loading-bar"></div></div><h3 style="    color: #fff;position: absolute;left: 50%;top: 80%;margin: 0px 0 0px -75px;display: inline-block;" class="Raleway">Saving Project...please wait a moment</h3>' +
            '</div>';
        $(over).appendTo('body');

        // click on the overlay to remove it
        //$('#overlay').click(function() {
        //    $(this).remove();
        //});

        // hit escape to close the overlay
        $(document).keyup(function(e) {
            if (e.which === 27) {
                $('#overlay').remove();
            }
        });
    };


 $('.new-project-form').submit(function (e) {
    // $(".spinner").css("display", "inline-block");
    showloader();
    var form = this;
    e.preventDefault();
    setTimeout(function () {
        form.submit();
    }, 5000); // in milliseconds
});
       
 function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.prev-pic').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
    
    // $(".upload-button").on('click', function() {
    //   $(".file-upload").click();
    // });  