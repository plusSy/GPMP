/**
 * Created by Administrator on 2017/3/14.
 *
 */
$(function(){
    //添加模版
    var newTr = "<tr><td><input type='text'></td><td><select  style='width: 80px;'><option value='0'>请选择</option><option value='1'>临时</option> <option value='2'>长久</option></select></td>"+
            "<td><input type='text'></td><td><select name='' style='width: 120px;'>"+ "<option value='0'>请选择</option></select></td><td style='color: #0560b4;'>张三</td><td><input type='text'></td>"+
            "<td><input type='text'></td><td><div class='statues-choice'></div></td><td><input type='checkbox'></td>"+
            "<td><button>╳</button></td></tr>";
    $(".addRiskWay").on("click",function () {
        //获取tbody img->td->tr->tbody
        var a = $(this).parent().parent().parent();
        //父结点删除
        a.append(newTr);
    });
    $(".riskWay tbody tbody").delegate('button', 'click', function() {
        //获取当前要删除的行 tr
        var delTr = $(this).parent().parent();
        delTr.remove();
    });
});