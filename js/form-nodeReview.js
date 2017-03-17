/**
 * Created by hand on 2017/3/17.
 */
$(function(){
    //添加模版
    var newTr = "<tr><td ><input type='text' style='width: 200px;'></td> " +
        "<td ><input type='text' style='width: 50px;'></td>"+
        "<td ><input type='text' style='width: 200px;'></td>"+
        "<td ><input type='text'  style='width: 50px; '></td>"+
        "<td ><input type='text'  style='width: 100px;'></td>"+
        "<td >"+
        "<img src='../img/close-icno.png'  class='removeNodeReview' alt='' style='width: 18px;height: 18px;'>"+
        "</td>"+
        "</tr>";
    $(".addNodeReview").on("click",function () {
        //获取tbody  img->td->tr->tbody
        var a = $(this).parent().parent().parent();
        //父结点删除
        a.append(newTr);
    });
    $(".nodeEvaluation-table tbody").delegate('img[class="removeNodeReview"]', 'click', function() {
        //获取当前要删除的行 tr
        var delTr = $(this).parent().parent();
        delTr.remove();
    });


    //添加模版2
    var newTr2 = "<tr><td ><input type='text' style='width: 200px;'></td>"+
        "<td ><input type='text' style='width: 50px;'></td>"+
        "<td ><input type='text' style='width: 200px;'></td>"+
        "<td><input type='text' style='width: 170px;'></td>"+
        "<td >"+
        "<img src='../img/close-icno.png' class='removeNodeReviewTwo' alt='' style='width: 18px;height: 18px;'>"+
        "</td>"+
        "</tr>";
    $(".addNodeReviewTwo").on("click",function () {
        //获取tbody  img->td->tr->tbody
        var a = $(this).parent().parent().parent();
        //父结点删除
        a.append(newTr2);
    });
    $(".nodeReview2 tbody").delegate('img[class="removeNodeReviewTwo"]', 'click', function() {
        //获取当前要删除的行 tr
        var delTr = $(this).parent().parent();
        delTr.remove();
    });
});