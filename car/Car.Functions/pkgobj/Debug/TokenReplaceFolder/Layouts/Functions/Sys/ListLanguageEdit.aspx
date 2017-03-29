<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListLanguageEdit.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Sys.ListLanguageEdit" DynamicMasterPageFile="~masterurl/default.master" %>

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
    <link href="/_layouts/15/functions/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="/_layouts/15/functions/bootstrap-table/bootstrap-table-locale-all.min.js"></script>
    <link href="/_layouts/15/functions/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.min.js"></script>
    <script src="/_layouts/15/functions/bootstrap-table/extensions/editable/bootstrap-table-editable.min.js"></script>
    <script src="/_layouts/15/functions/bootstrap-tabl-editable/dist/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script src="/_layouts/15/functions/bootstrap-table/extensions/editable/mindmup-editabletable.js"></script>
    <script src="/_layouts/15/functions//CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>

    <script>
        function OpenTab(e) {
            var pid = $.OpzoonGetQueryParam("pid");
            window.location.href = $(e).attr("href") + "&pid=" + pid;
            return false;
        }
        //$("a[data-name='Gate1_Status']").editable("disable",true)
    </script>
    <script>
        $(function () {

            var editableoption = {
                type: "text",  validate: function (value) {
                
                }
            }

            $('#table').bootstrapTable({
                method: "get",
                queryParamsType: '',
                pagination: true,
                url: "/_vti_bin/Car/PortalService.svc/GetListAllLanguage",
                singleSelect: true,
                smartDisplay: true,
                sidePagination: "server",
                search: true,
                queryParams: function (params) {
                    params.ListID = $.OpzoonGetQueryParam("list");
                    params._t = new Date().getTime();
                    return params;
                },
                pageSize: 20,
                pageList: [10, 20, 40, 80],
              //  toolbar: "#toolbar1",
                uniqueId:"Key",
                columns: [
                         { field: 'Key', title: '标题', width: 80, valign: "middle" },
                         { field: 'CN', title: '中文', width: 80, valign: "middle", editable: editableoption },
                         { field: 'EN', title: '英文', width: 80, valign: "middle", editable: editableoption }
                         
                ], 
                onEditableSave: function (field, row, oldVal, obj) {
                    ChangeTarget(row, field, row[field]);
                } 
            });

        


        });
        function ChangeTarget(tar, fie, val) {
            var postData = {};
            postData.target = tar;
            postData.field = fie;
            postData.newValue = val;
            postData.ListID = $.OpzoonGetQueryParam("list");
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("UpdateListLanguage", postData, function (responseData) {
                if (responseData.Result) {
                    $('#table').bootstrapTable("refresh");
                }
                else {
                    alert(responseData.Message);
                }
            }, function () { });
        }
         
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <span style="color:red">警告：只能将网站切换到对应的语言下，修改对应的语言字段才能生效，该功能只是简化修改字段语言时频繁切换页面操作。</span>
                <table id="table"></table>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    多语言编辑
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    多语言编辑
</asp:Content>
