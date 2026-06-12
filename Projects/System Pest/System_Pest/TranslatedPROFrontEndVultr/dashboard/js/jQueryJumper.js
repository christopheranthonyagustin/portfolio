
$(".faq").on("click", function( f ) {
    
    f.preventDefault();

    $("body, html").animate({ 
        scrollTop: $( $(this).attr('href') ).offset().top 
    }, 600);
    
});