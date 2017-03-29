<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DownloadTemplateUserControl.ascx.cs" Inherits="Car.Functions.DownloadTemplate.DownloadTemplateUserControl" %>
<script>
    $(function () {
        $("input[id^='Title_']").parentsUntil("tbody").hide();
    });
</script>
<table class="ms-formtable" style="margin-top: 8px;" border="0" cellpadding="0" cellspacing="0" width="100%">



    <tbody>
        <tr>
            <td nowrap="true" valign="top" width="113px" class="ms-formlabel"><span class="ms-h3 ms-standardheader">
                <nobr>下载模板</nobr>
            </span></td>
            <td valign="top" width="350px" class="ms-formbody">

                <span dir="none">
                    <a href="/_layouts/15/functions/template/meeting.xls" target="_blank">项目启动会报告（项目制造可行性评估）模板</a>
                    <br>
                </span>



            </td>
        </tr>
    </tbody>
</table>
