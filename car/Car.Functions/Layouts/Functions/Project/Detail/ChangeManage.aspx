<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeManage.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.ChangeManage" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">   <!--bootstrap-->
        <script src="/_layouts/15/UI/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="/_layouts/15/UI/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="/_layouts/15/UI/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
          <!--[if lt IE 9]> 
        <script src="/_layouts/15/UI/html5shiv/html5shiv.js"></script>
        <script src="/_layouts/15/UI/respond/respond.min.js"></script> 
  <![endif]-->
    <link href="/_layouts/15/functions/Css/gpmp.css" rel="stylesheet" />    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script>
        function OpenTab(e) {
            var pid = $.OpzoonGetQueryParam("pid");
            window.location.href = $(e).attr("href")+"&pid="+pid;
            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
  
        <div class="widget-container-span ui-sortable">
            <div class="widget-body">
                <div class="widget-main no-padding">
                    <div class="table-responsive" style="width: 98%">
                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                            <tr>
                                <td align="left" colspan="3" style="border: 0"><strong style="color: #1A62AE">变更信息列表</strong></td>
                                <td align="right" colspan="2" style="border: 0"><strong style="color: blue"><a onclick='window.open("新建变更.html","newwindow2", "height=550, width=820, top=100, left=250,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")'><i class="glyphicon glyphicon-plus-sign"></i>新增变更 </a></strong></td>
                            </tr>
                            <tr>
                                <td style="border: 0"><strong style="color: #1A62AE">Minth设通号</strong></td>
                                <td style="border: 0"><strong style="color: #1A62AE">客户设通号</strong></td>
                                <td style="border: 0" class="hidden-480"><strong style="color: #1A62AE">变更日期</strong></td>
                                <td style="border: 0"><strong style="color: #1A62AE">责任人</strong> </td>
                                <td style="border: 0"><strong style="color: #1A62AE">模具设变成本（RMB）</strong></td>
                            </tr>
                            <tbody>
                                <tr>
                                    <td><a href="#">C12783</a> </td>
                                    <td class="hidden-480">c3121</td>
                                    <td>2016/12/12</td>
                                    <td class="hidden-480">jianan，wen（IT_center） </td>
                                    <td>1234 </td>
                                </tr>
                                <tr>
                                    <td><a href="#">C12783</a> </td>
                                    <td class="hidden-480">c3121</td>
                                    <td>2016/12/12</td>
                                    <td class="hidden-480">jianan，wen（IT_center） </td>
                                    <td>1234 </td>
                                </tr>
                                <tr>
                                    <td><a href="#">C12783</a> </td>
                                    <td class="hidden-480">c3121</td>
                                    <td>2016/12/12</td>
                                    <td class="hidden-480">jianan，wen（IT_center） </td>
                                    <td>1234 </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="border: 0">显示第1至3条，共3条</td>
                                    <td style="border: 0;" colspan="2" align="right"><a href="#"><i class="icon-angle-left"></i></a>1 <a href="#"><i class="icon-angle-right"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive" style="width: 98%">
                        <table id="sample-table-3" class="table table-striped table-bordered table-hover">
                            <tr>
                                <td align="left" colspan="5" style="border: 0"><strong style="color: #1A62AE">项目变更履历</strong></td>
                                <tr>
                                    <td style="border: 0"><strong style="color: #1A62AE">类型</strong></td>
                                    <td style="border: 0"><strong style="color: #1A62AE">名称</strong></td>
                                    <td style="border: 0" class="hidden-480"><strong style="color: #1A62AE">修改时间</strong></td>
                                    <td style="border: 0"><strong style="color: #1A62AE">修改者</strong> </td>
                                </tr>
                                <tbody>
                                    <tr>
                                        <td><a href="#">C12783</a> </td>
                                        <td class="hidden-480">c3121</td>
                                        <td>2016/12/12</td>
                                        <td class="hidden-480">jianan，wen（IT_center） </td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">C12783</a> </td>
                                        <td class="hidden-480">c3121</td>
                                        <td>2016/12/12</td>
                                        <td class="hidden-480">jianan，wen（IT_center） </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="border: 0">显示第1至2条，共2条</td>
                                        <td style="border: 0;" colspan="2" align="right"><a href="#"><i class="icon-angle-left"></i></a>1 <a href="#"><i class="icon-angle-right"></i></a></td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    变更管理
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    变更管理
</asp:Content>
