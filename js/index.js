$(document).ready(function() {
    $(".painting").click(function(ev) {
        $('#moreinfo-prompt').hide();
        var href = $(this).attr("data-href");
        console.log(href);
        var target = false;
        $('.artwork-row').each(function(idx, elem) {
            if ($(elem).attr("data-href") == href) {
                target = $(elem);
            }
        });
        if (target) {
            console.log("WE FOUND IT!");
            $('.artwork-row').hide();
            $('.painting').removeClass("animated bounce");
            target.show();
            $(this).addClass("animated bounce");
        }
    });
});
