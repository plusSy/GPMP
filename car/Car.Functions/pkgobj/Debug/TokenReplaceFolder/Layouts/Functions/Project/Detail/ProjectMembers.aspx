<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMembers.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.ProjectMembers" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <!--bootstrap-->
    <script src="/_layouts/15/UI/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/_layouts/15/UI/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/_layouts/15/UI/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!--[if lt IE 9]> 
        <script src="/_layouts/15/UI/html5shiv/html5shiv.js"></script>
        <script src="/_layouts/15/UI/respond/respond.min.js"></script> 
  <![endif]-->
    <link href="/_layouts/15/functions/Css/gpmp.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>
    <script src="/_layouts/15/functions/Script/knockout-3.4.1.js"></script>
    <script src="/_layouts/15/functions/Script/knockout.mapping.js"></script>
    <script>
        function OpenTab(e) {
            var pid = $.OpzoonGetQueryParam("pid");
            window.location.href = $(e).attr("href") + "&pid=" + pid;
            return false;
        }

        $(function () {
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").GetMethod("GetProjectByPID", { pid: $.OpzoonGetQueryParam("pid") }).done(function (data) {
                ko.applyBindings(data, document.getElementById("projectmember"));
            });

        });
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <ul class="nav nav-tabs">
        <li><a href="/_layouts/15/functions/project/detail/ProjectInfo.aspx?isdlg=1" onclick="return OpenTab(this);">项目信息</a></li>
        <li class="active"><a href="/_layouts/15/functions/project/detail/ProjectMembers.aspx?isdlg=1" onclick="return OpenTab(this);">项目成员</a></li>
        <li><a href="/_layouts/15/functions/project/detail/ProjectTarget.aspx?isdlg=1" onclick="return OpenTab(this);">项目目标</a></li>
        <li><a href="/_layouts/15/functions/project/detail/GateManage.aspx?isdlg=1" onclick="return OpenTab(this);">节点管理</a></li>
        <li><a href="/_layouts/15/functions/project/detail/RiskManage.aspx?isdlg=1" onclick="return OpenTab(this);">风险管理</a></li>
        <li><a href="/_layouts/15/functions/project/detail/ChangeManage.aspx?isdlg=1" onclick="return OpenTab(this);">变更管理</a></li>
    </ul>
    <div class="tab-content">
        <ul class="wizard-steps">
            <li data-target="#step1" class="active"><span class="step">1</span> <span class="title">GATE1</span> </li>
            <li data-target="#step2" class="active"><span class="step">2</span> <span class="title">GATE2</span> </li>
            <li data-target="#step3"><span class="step">3</span> <span class="title">GATE3</span> </li>
            <li data-target="#step4"><span class="step">4</span> <span class="title">GATE4-1</span> </li>
            <li data-target="#step5"><span class="step">4</span> <span class="title">GATE4-2</span> </li>
            <li data-target="#step6"><span class="step">5</span> <span class="title">GATE5</span> </li>
            <li data-target="#step7"><span class="step">S</span> <span class="title">SOP</span></li>

        </ul>
        <table id="Table1" class="table table-striped table-bordered table-hover">
            <tbody>
                <tr>
                    
                        <td>C02405-CFD701-C519-亮条-门框饰条BRIGHT STRIP DOOR FRAME</td>
                        <td align="center">
                            <img src="/_layouts/15/functions/images/G.png" /></td>
                        <td align="center">
                            <img src="/_layouts/15/functions/images/Y.png" /></td>
                        <td align="center">
                            <img src="/_layouts/15/functions/images/R.png" /></td>
                        <td align="center">
                            <img src="/_layouts/15/functions/images/R.png" /></td>
               
                </tr>
            </tbody>
        </table>
        <table class="table table-striped table-bordered table-hover" id="projectmember">
            <thead style="background: #006699; color: #FFFFFF;">
                <tr>
                    <th colspan="6">
                        <button type="button" class="btn btn-xs btn-primary"></button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">项目经理</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: PM_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">承接业务员</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: BM_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 16%;" class="auto-style3">项目工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: PE_Name"></span></td>
                </tr>
                <tr>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">设计工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: ToolEngineer_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">工装工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: DE_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 16%;" class="auto-style3">工艺策划工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: STE_Name"></span></td>
                </tr>
                <tr>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">质量工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: QE_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">供应商质量工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: SEQ_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 16%;" class="auto-style3">量产经理/量产工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: LM_ME_Name"></span></td>
                </tr>
                <tr>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">检测工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: TestingEngineer_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">包装工程师</td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: PackageE_Name"></span></td>
                    <td style="color: #0000FF; font-size: small; width: 16%;" class="auto-style3"></td>
                    <td style="font-size: small; width: 22%;" class="auto-style3"></td>
                </tr>
            </tbody>
        </table>
</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    项目成员
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    项目成员
</asp:Content>
