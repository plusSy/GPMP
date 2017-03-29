<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectInfo.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.ProjectInfo" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">   <!--bootstrap-->
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
            window.location.href = $(e).attr("href") + "&pid=" + decodeURI(pid);
            debugger;
            return false;
        }


        $(function () {  
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").GetMethod("GetProjectByPID", { pid: $.OpzoonGetQueryParam("pid") }).done(function (data) {
                ko.applyBindings(data, document.getElementById("projectInfo"));
            });
      
        });
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
  
            <table class="table table-striped table-bordered table-hover" id="projectInfo">
                <thead style="background: #006699; color: #FFFFFF">
                    <tr>
                        <th colspan="6">
                            <button type="button" class="btn btn-sm btn-success">保 存 </button>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="color: #FF0000; font-size: small; width: 12%;" class="auto-style3">项目级别</td>
                        <td class="auto-style3" style="font-size: small;">
                            <select class="form-control">
                                <option value="">&nbsp;</option>
                                <option value="AL">A</option>
                                <option value="AK">B</option>
                                <option value="AZ">C</option>
                                <option value="AR">D</option>
                            </select></td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">系统项目编号</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Project_Number"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">项目编码</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Project_Code"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">产品小类</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Product_Sub_Category_Name"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">产品名称</td>
                        <td style="font-size: small;" class="auto-style3" colspan="3"><span data-bind="text: Project_Name"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">产品大类</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Product_Category_Name"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">汽车集团</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Product_Group_Name"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">直接客户</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Direct_Customer"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">最终客户</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: EndUser"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车型代码（客户）</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Cust_VehicleCode"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车型代码（敏实）</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Minth_VehicleCode"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">品牌</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: BrandidName"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车型名称（客户）</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: ModelName"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车型名称（敏实）</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Model_Englishname"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车辆类型</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: CartypeidName"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车辆级别</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: CarlevelName"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">车型最大年产量</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: New_Annualoutput"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">声明周期</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: ModelLife"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">核心材料</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Core_Material"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">核心工艺类型</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Core_Process_Stage1"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">核心工艺</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Core_Process_Stage2"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">物面处理要求</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Core_Process_Stage3"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">是否同步设计</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: IsSync_Design"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">成本生产工厂</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: InternalResourcesidName"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">成品生产区域</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: CompanyRegionidName"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">销售工厂</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Sales_InternalResourceidName"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">销售区域</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Sales_CompanyRegionidName"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">开发单位</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Development_Unit"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">是否是全球订单</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Global_OrderOrNot"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">客户系别</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Product_Promo_Name"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">国内或国外</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: DomesticOfOverseas"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">项目工作负荷</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Project_Workload"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">销售区域</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Sales_CompanyRegionidName"></span></td>
                    </tr>
                    <tr>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">成品生产区域</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: CompanyRegionidName"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">半成品生产区域</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: SemiFinished_Product_Region1"></span></td>
                        <td style="color: #0000FF; font-size: small; width: 12%;" class="auto-style3">零件数量</td>
                        <td style="font-size: small; width: 22%;" class="auto-style3"><span data-bind="text: Part_Quantity"></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    项目信息
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    项目信息
</asp:Content>
