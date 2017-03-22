/**
 * Created by Administrator on 2017/3/14.
 *
 */
$(function(){
    //添加模版
    var newTr = " <tr>"+
        "<td>"+
        "<input type='text'>"+
        "</td>"+
        "<td>"+
        "<select>"+
        "<option>请选择</option>"+
        "</select>"+
        "</td>"+
        "<td><input type='text'></td>"+
        "<td><input type='text'></td>"+
        "<td>"+
        "<select>"+
        "<option>通过</option>"+
        "<option>不通过</option>"+
        "</select>"+
        "</td>"+
        "<td>"+
        "<div class='statues-choice'></div>"+
        "</td>"+
        "<td>"+
        "<button style='border:none;background-color:#ffffff;cursor:pointer;'>╳</button>"+
        "</td>"+
        "</tr>";
    $(".addChangeRow").on("click",function () {
        //获取tbody img->td->tr->tbody
        var a = $(this).parent().parent().parent();
        //父结点删除
        a.append(newTr);
    });
    $(".romveChange tbody ").delegate('button', 'click', function() {
        //获取当前要删除的行 tr
        var delTr = $(this).parent().parent();
        delTr.remove();
    });
});