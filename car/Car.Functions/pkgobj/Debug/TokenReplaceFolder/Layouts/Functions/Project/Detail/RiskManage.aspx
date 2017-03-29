<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskManage.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.RiskManage" DynamicMasterPageFile="~masterurl/default.master" %>

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
  
        <table class="table table-striped table-bordered table-hover">
            <thead style="background: #006699; color: #FFFFFF">
                <tbody>
                    <tr>
                        <td>
                            <div class="widget-container-span ui-sortable">
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <div class="table-responsive" style="width: 98%">
                                            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <td align="left" colspan="4" style="border: 0"><strong style="color: #1A62AE">高风险开放问题列表</strong></td>
                                                    <td align="right" colspan="3" style="border: 0"><strong style="color: blue"><a onclick='window.open("新建高分险.html","newwindow2", "height=550, width=850, top=100, left=250,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")'>
                                                        <i class="glyphicon glyphicon-plus-sign"></i>新增高风险</a></strong></td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 0"><strong style="color: #1A62AE">标题</strong></td>
                                                    <td style="border: 0"><strong style="color: #1A62AE">项目编号</strong></td>
                                                    <td style="border: 0" class="hidden-480"><strong style="color: #1A62AE">职责范围</strong></td>
                                                    <td style="border: 0"><strong style="color: #1A62AE">担当</strong></td>
                                                    <td style="border: 0"><strong style="color: #1A62AE">严重度</strong></td>
                                                    <td style="border: 0"><strong style="color: #1A62AE">实际关闭日期</strong></td>
                                                    <td style="border: 0"><strong style="color: #1A62AE">逾期天数</strong></td>
                                                </tr>
                                                <tbody>
                                                    <tr>
                                                        <td class="hidden-480">捷豹路虎L560项目组立志具开发</td>
                                                        <td class="hidden-480">EP006658</td>
                                                        <td class="hidden-480">项目管理</td>
                                                        <td class="hidden-480">Xu,Ning</td>
                                                        <td class="hidden-480" style="background-color: yellow">Low Risk(GM)</td>
                                                        <td class="hidden-480">2016/11/23</td>
                                                        <td class="hidden-480">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="hidden-480">捷豹路虎L560项目组立志具开发</td>
                                                        <td class="hidden-480">EP006658</td>
                                                        <td class="hidden-480">项目管理</td>
                                                        <td class="hidden-480">Xu,Ning</td>
                                                        <td class="hidden-480" style="background-color: #c94d32">High Risk(GM)</td>
                                                        <td class="hidden-480">2016/11/23</td>
                                                        <td class="hidden-480">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="hidden-480">捷豹路虎L560项目组立志具开发</td>
                                                        <td class="hidden-480">EP006658</td>
                                                        <td class="hidden-480">项目管理</td>
                                                        <td class="hidden-480">Xu,Ning</td>
                                                        <td class="hidden-480" style="background-color: #e8b110">Medium Risk(GM)</td>
                                                        <td class="hidden-480">2016/11/23</td>
                                                        <td class="hidden-480">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" style="border: 0">显示第1至3条，共3条</td>
                                                        <td style="border: 0;" colspan="2" align="right"><a href="#"><i class="icon-angle-left"></i></a>1 <a href="#"><i class="icon-angle-right"></i></a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="table-responsive" style="width: 98%; margin-top: 35px">
                                            <table id="sample-table-3" class="table table-striped table-bordered table-hover">
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
        </table>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    风险管理
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    风险管理
</asp:Content>
