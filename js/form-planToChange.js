/**
 * Created by hand on 2017/3/17.
 */
$(function(){
    //添加模版
    var newTr = "<tr><td><span></span></td> <td><span></span></td><td><span></span></td>"+
        "<td><img src='../img/close-icno.png' class='removePlanWay' style='width: 20px;height: 20px;cursor: pointer;'></td></tr>";
    $(".addPlanWay").on("click",function () {
        //获取tbody  img->td->tr->tbody
        var a = $(this).parent().parent().parent();
        //父结点删除
        a.append(newTr);
    });
    $(".itemMessage-table tbody tr td").delegate('.removePlanWay', 'click', function(e) {
        //获取当前要删除的行 tr
        console.log('ggggg');
        e.preventDefault();
        debugger;
        var delTr = $(this).parent().parent();
        console.log(delTr);
        delTr.remove();
    });
})();

function viewPlanTimeChange(){
    window.open('./timeChangeRecord.html','newwindow', "width=900, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no")
}