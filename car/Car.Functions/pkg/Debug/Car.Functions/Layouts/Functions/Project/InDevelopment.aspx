<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InDevelopment.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.InDevelopment" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
     <!--bootstrap-->
        <script src="/_layouts/15/UI/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="/_layouts/15/UI/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="/_layouts/15/UI/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
          <!--[if lt IE 9]> 
        <script src="/_layouts/15/UI/html5shiv/html5shiv.js"></script>
        <script src="/_layouts/15/UI/respond/respond.min.js"></script> 
  <![endif]-->
    <link href="/_layouts/15/functions/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/bootstrap-table/bootstrap-table.min.js"></script> 
    <script>
        $(function () {
            $('#table').bootstrapTable({
                method: "get",
                queryParamsType: '',
                pagination: true,
                url: "/_vti_bin/Car/PortalService.svc/GetAllProject",
                singleSelect: true,
                smartDisplay: true,
                sidePagination: "server",
                search: true,
                queryParams: function (params) {
                    params.departmentId = 1;
                    return params;
                },
                pageSize: 20,
                pageList: [10, 20, 40, 80],
                columns: [{
                    field: 'Project_Number',
                    title: '项目编号',
                    formatter: function (value, row, index) {
                        return '<a href="/_layouts/15/functions/project/detail/ProjectInfo.aspx?isdlg=1&pid=' + value.replace("#", "%23") + '">' + value + '</a>';
                    }
                }, {
                    field: 'Product_Group_Name',
                    title: '汽车集团'
                }, {
                    field: 'Project_Name',
                    title: '项目名称'
                }, {
                    field: 'PM_Name',
                    title: '项目经理'
                }, {
                    field: 'gate',
                    title: '项目阶段',
                    formatter: function () {
                        return '<span class="label label-sm label-warning">GATE1</span>';
                    }
                }, {
                    field: 'state',
                    title: '项目状态',
                    formatter: function () {
                        return '<span class="badge badge-info" style="background: #00FF00">1</span>';
                    }
                }] 
            });
        });

    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server"><table id="table"></table>
</asp:Content>


<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
开发中的项目
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
开发中的项目
</asp:Content>
