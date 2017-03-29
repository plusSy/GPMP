<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanDateTimeChangeRecord.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.PlanDateTimeChangeRecord" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <style>
        /*节点日期变更记录*/
        .nodeTimeChangeRecord {
            width: 740px;
            background-color: #ffffff;
            margin: 0 auto;
            font-size: 14px;
        }

        .nodeTimeChangeRecord-table {
            border-collapse: collapse;
        }

            .nodeTimeChangeRecord-table tr > th, .nodeTimeChangeRecord-table tr > td {
                border: 1px solid #9b9b9b;
                line-height: 20px;
                padding: 3px 0 3px 10px;
            }

        .nodeTimeChangeRecord-table-thead {
            padding-left: 10px;
            background-color: #0560b4;
            color: #ffffff;
            font-size: 16px;
            text-align: left;
            height: 30px;
            line-height: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div class="nodeTimeChangeRecord">
        <table class="nodeTimeChangeRecord-table">
            <thead>
                <tr>
                    <th class="nodeTimeChangeRecord-table-thead" colspan="6">计划时间变更记录</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 300px;">任务名称</td>
                    <td style="width: 105px;">原计划时间</td>
                    <td style="width: 105px;">新计划时间</td>
                    <td style="width: 105px;">申请人</td>
                    <td style="width: 105px;">申请时间</td>
                </tr>
                <tr>
                    <td>项目启动会议报告(项目制造可行性评估)</td>
                    <td>07／01／2014</td>
                    <td>07／01／2014</td>
                    <td>Qin.Yachuang</td>
                    <td>07／01／2014</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    计划时间变更记录
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    计划时间变更记录
</asp:Content>
