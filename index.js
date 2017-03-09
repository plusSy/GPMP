/**
 * Created by applesyl on 2017/3/5.
 */
$(function(){

    $(".left-second-nav-ul").slideUp(1000);
    $(".left-nav-li").off("click");

    $(".left-nav-li").on("click",function(){
        if($(this).find("ul").css("display")=="none"){
            $(".left-second-nav-ul").slideUp(1000);
            $(this).find("ul").slideDown(1000);
        }else{
            $(this).find("ul").slideUp(500);
            $(this).find("ul").css("display:block");
        };
    });

    $(".left-second-nav-li").on("click",function (event) {
        event.stopPropagation();
    });
});

function turnTo(link){
    document.getElementById('iframe_first').src = link;
}
