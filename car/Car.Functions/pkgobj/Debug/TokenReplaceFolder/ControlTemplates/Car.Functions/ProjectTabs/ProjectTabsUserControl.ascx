<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectTabsUserControl.ascx.cs" Inherits="Car.Functions.ProjectTabs.ProjectTabsUserControl" %>

<style>
    .nav > li > a {
        padding: 6px 15px;
    }
</style>
<ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#" _href='/Lists/proj_project/DispForm.aspx?ID=<%=Request.QueryString["ID"] %>&isdlg=1' role="tab" data-toggle="tab" id="ProjectInfo"><%=GetTitle("ProjectInfoAndMember") %></a></li>
    <li role="presentation"><a href="#" _href="/_layouts/15/functions/project/detail/ProjectObjective.aspx?isdlg=1&pid=<%=Request.QueryString["ID"] %>" role="tab" data-toggle="tab" id="ProjectObjective"><%=GetTitle("ProjectObjective") %></a></li>
    <li role="presentation"><a href="#" _href="/_layouts/15/functions/project/detail/NodeManagement.aspx?isdlg=1&pid=<%=Request.QueryString["ID"] %>" role="tab" data-toggle="tab" id="GateManage"><%=GetTitle("GateManagement") %></a></li>
    <li role="presentation"><a href="#" _href="/_layouts/15/functions/project/detail/RiskManage.aspx?isdlg=1&pid=<%=Request.QueryString["ID"] %>" role="tab" data-toggle="tab" id="RiskManage"><%=GetTitle("IssueManagement") %></a></li>
    <li role="presentation"><a href="#" _href="/_layouts/15/functions/project/detail/ChangeManage.aspx?isdlg=1&pid=<%=Request.QueryString["ID"] %>" role="tab" data-toggle="tab" id="ChangeManage"><%=GetTitle("ChangeManagement") %></a></li>
</ul>
<div id="mainFrame"></div>
<script>
    var parent = undefined;
    $(function () {
        //tab点击事件
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            if (e.target.id == "ProjectInfo") {
                $(".div1").show();
                //如果是项目信息，隐藏iframe
                $("#MSOZoneCell_WebPartWPQ2").show();
                parent.remove();
            } else {
                $(".div1").hide();
                $("#MSOZoneCell_WebPartWPQ2").hide();
                var url = $(e.target).attr("_href");
                parent = new pym.Parent("mainFrame", url, {});
            }
        })

    });


 
</script>
