<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectStepUserControl.ascx.cs" Inherits="Car.Functions.ProjectStep.ProjectStepUserControl" %>
<link href="/_layouts/15/functions/Css/gpmp.css" rel="stylesheet" />
<script>


    $(function () {
        //设置当前步骤
        var _step = _ProjectInfo.Project_Gate.Label;
        $(".wizard-steps").find("li[data-step='" + _step + "']").prevAll().addClass("active");



        //如果是编辑页面，保存后回到显示页
        ExecuteOrDelayUntilScriptLoaded(Call, "inplview.js"); 
    });

    function Call() { 
        if (window.location.pathname.endsWith("CustomEditForm.aspx")) { 
            var _url = $("form").attr("action");
            var _id = Nav.getUrlKeyValue("ID");
            var _source = "/Lists/proj_project/CustomDispForm.aspx?ID=" + _id
            var _newUrl = SetUrlKeyValue("Source", _source, _url);
            $("form").attr("action", _newUrl);

        }
    }

</script>

<ul class="wizard-steps">
    <%--class="active"--%>
    <asp:Repeater ID="StepRep" runat="server">
        <ItemTemplate>
            <li data-target="#step1"><span class="step">1</span> <span class="title">GATE1</span> </li>
        </ItemTemplate>

    </asp:Repeater>

    <li data-target="#step1" class="active" data-step="Gate 1"><span class="step">1</span> <span class="title">GATE1</span> </li>
    <li data-target="#step2" data-step="Gate 2"><span class="step">2</span> <span class="title">GATE2</span> </li>
    <li data-target="#step3" data-step="Gate 3"><span class="step">3</span> <span class="title">GATE3</span> </li>
    <li data-target="#step4" data-step="Gate 4-1"><span class="step">4</span> <span class="title">GATE4-1</span> </li>
    <li data-target="#step5" data-step="Gate 4-2"><span class="step">4</span> <span class="title">GATE4-2</span> </li>
    <li data-target="#step6" data-step="Gate 5"><span class="step">5</span> <span class="title">GATE5</span> </li>
    <li data-target="#step7" data-step="SOP"><span class="step">S</span> <span class="title">SOP</span></li>

</ul>
<table id="Table1" class="table table-striped table-bordered table-hover" style="margin-bottom: 0">
    <tbody>
        <tr>
            <td>
                <asp:Label Text="" runat="server" ID="ProjectTitle" /></td>
            <td align="center" style="width: 10%">
                <img src="/_layouts/15/functions/images/<%=QStatus %>.png" style="height: 22px;" alt="Q" /></td>
            <td align="center" style="width: 10%">
                <img src="/_layouts/15/functions/images/<%=CStatus %>.png" style="height: 22px;" alt="C" /></td>
            <td align="center" style="width: 10%">
                <img src="/_layouts/15/functions/images/<%=DStatus %>.png" style="height: 22px;" alt="D" /></td>
            <td align="center" style="width: 10%">
                <img src="/_layouts/15/functions/images/<%=PStatus %>.png" style="height: 22px;" alt="P" /></td>
        </tr>
    </tbody>
</table>
