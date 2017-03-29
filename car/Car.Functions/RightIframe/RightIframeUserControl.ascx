<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightIframeUserControl.ascx.cs" Inherits="Car.Functions.RightIframe.RightIframeUserControl" %>
<iframe src="/_layouts/15/functions/default.aspx?isdlg=1" name="mainFrame" id="mainFrame"
    frameborder="no" scrolling="auto" hidefocus="" style="width: 100%; height: 100%; position: relative; overflow: hidden"></iframe>


<script>     setInterval("ReSize()", 1000);
    function ReSize() {
        $("#mainFrame").height($("#s4-workspace").height());
    }
</script>

<style>
    #s4-workspace {
        overflow: hidden;
    }
</style>
