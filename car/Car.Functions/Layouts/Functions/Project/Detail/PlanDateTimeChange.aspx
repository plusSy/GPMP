<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanDateTimeChange.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.PlanDateTimeChange" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

    <script src="/_layouts/15/UI/jquery-easyui/jquery.easyui.min.js"></script>
    <link href="/_layouts/15/UI/jquery-easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="/_layouts/15/UI/jquery-easyui/themes/icon.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>
    <link href="/_layouts/15/functions/css/nodemanagement.css" rel="stylesheet"></link>
    <script src="/_layouts/15/functions/Script/moment/moment.min.js"></script>
    <script src="/_layouts/15/functions/Script/moment/moment.min.js"></script>
    <link href="/_layouts/15/functions/Script/date/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/Script/date/js/bootstrap-datetimepicker.min.js"></script>
    <style>
        .panel-body {
            padding: 0 !important;
        }

        .datagrid-row td {
            border-left: none;
            border-color: #9b9b9b !important;
            border-width: 0px 0px 1px 0;
            border-style: solid;
            margin: 0;
            padding: 0;
        }

        .panel-header, .panel-body {
            border-color: #9b9b9b;
        }

        .panel {
            border-top: none !important;
        }
        /*按钮背景色冲突*/
        .btn-primary:focus, .btn-primary:hover {
            background-color: #265a88 !important;
        }
    </style>

    <script>


        $(function () {
            //数据表通用设置
            $('#DataGridOtherChange').datagrid({
                singleSelect: true,
                rowStyler: function () {
                    return "min-height:30px; ";
                },
                nowrap: false,
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetDateTimeChnageTask",
                queryParams: {
                    ChageTaskID: $("input[id$='HDChangeDateID']").val(),
                    _t: new Date().getTime()
                },
                columns: [[
                    {
                        field: 'Title', title: '任务名称', width: "40%", editor:
                         {
                             type: "combobox", options: {
                                 url: "/_vti_bin/Car/PortalService.svc/GetUserTasks?taskid=" + $.OpzoonGetQueryParam("taskid") + "&pid=" + $.OpzoonGetQueryParam("pid"),
                                 valueField: "ID",
                                 textField: "Title",
                                 method: "get",
                                 panelHeight: "auto",
                                 editable: false,
                                 required: true,
                                 onSelect: function (rec) {
                                     var ddd = moment(rec["PlanDate"]).format("YYYY-MM-DD");
                                     var ed = $('#DataGridOtherChange').datagrid('getEditor', { index: _addIndex, field: 'OldPlanDate' });
                                     $(ed.target).datebox('setValue', ddd);

                                     var row = $("#DataGridOtherChange").datagrid("getRows")[_addIndex];
                                     row["Task"] = rec.Project;
                                     row["TaskID"] = rec.ID;
                                 }
                             }
                         }
                    },
                    { field: 'OldPlanDate', title: '原计划时间', width: "25%", formatter: function (val) { return moment(val).format("YYYY-MM-DD"); }, editor: { type: "datebox", options: { formatter: dateboxFormatter, parser: dateboxParser, disabled: true } } },
                    {
                        field: 'NewPlanDate', title: '新计划时间', width: "25%", formatter: function (val) { return moment(val).format("YYYY-MM-DD"); }, editor: {
                            type: "datebox", options: {
                                formatter: dateboxFormatter, parser: dateboxParser, editable: false, required: true
                            }
                        }
                    },
                    {
                        field: 'ID', title: ' <img src="/_layouts/15/functions/images/add-icno.png" alt="" style="width: 18px; height: 18px;" onClick="AddOtherChange()">', width: "10%", formatter: function (val, rowData, index) {
                            if (rowData["NewPlanDate"]) {
                                return ' <img src="/_layouts/15/functions/images/close-icno.png" alt="" style="width: 20px; height: 20px; cursor: pointer;" onClick="DeleteOtherChange(' + index + ');" />';
                            } else {
                                return ' <img src="/_layouts/15/functions/images/save-icno.png" alt="" style="width: 20px; height: 20px; cursor: pointer;" onClick="SaveOtherChange();" /><img src="/_layouts/15/functions/images/close-icno.png" alt="" style="width: 20px; height: 20px; cursor: pointer;" onClick="CancelOtherChange();" />';
                            }
                        }
                    }
                ]],
                onAfterEdit: function (index, row, changes) {

                    row["OldPlanDate"] = $.GetJSONDate(row["OldPlanDate"]);
                    row["NewPlanDate"] = $.GetJSONDate(row["NewPlanDate"]);
                    row["proj_datechange_ID"] = _DateChangeID;

                    var postData = {};
                    postData.tasks = row;
                    $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("AddDateTimeChnageTask", postData, function (responseData) {
                        if (responseData.Result) {
                            //刷新页面
                            $('#DataGridOtherChange').datagrid("load", {
                                ChageTaskID: $("input[id$='HDChangeDateID']").val(),
                                _t: new Date().getTime()
                            });
                        }
                        else {
                            $('#DataGridOtherChange').datagrid("load", {
                                ChageTaskID: $("input[id$='HDChangeDateID']").val(),
                                _t: new Date().getTime()
                            });
                        }
                    }, function () {
                        alert("出现网络错误");
                    });
                }
            });

            $("input[id$='txtNewPlanDate']").datetimepicker({
                minView: 2,
                format: "yyyy-mm-dd",
                autoclose: true

            });
        });


        //打开节点变更记录
        function OpenChangeRecord() {
            var url = "/_layouts/15/functions/project/detail/PlandateTimeChangeRecord.aspx";

            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                SP.UI.ModalDialog.OpenPopUpPage(url, function () {
                    //关闭窗口调用
                }, 800);
            });
        }

        var _addIndex = undefined;
        function AddOtherChange() {
            $('#DataGridOtherChange').datagrid("appendRow", {});
            _addIndex = $("#DataGridOtherChange").datagrid('getRows').length - 1;
            $("#DataGridOtherChange").datagrid("beginEdit", _addIndex);
        }

        function SaveOtherChange() {
            var r = $('#DataGridOtherChange').datagrid("validateRow", _addIndex);
            if (r) {
                $('#DataGridOtherChange').datagrid("endEdit", _addIndex);
                _addIndex = undefined;
            }
            _addIndex = undefined;
        }

        function CancelOtherChange() {
            $('#DataGridOtherChange').datagrid("cancelEdit", _addIndex);
            $('#DataGridOtherChange').datagrid("deleteRow", _addIndex);
            _addIndex = undefined;
        }

        function DeleteOtherChange(index) {
            //    $('#DataGridOtherChange').datagrid("deleteRow", index);

            var rows = $('#DataGridOtherChange').datagrid("getRows");
            var row = rows[index];

            var postData = {};
            postData.tasks = row;
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("DeleteDateTimeChnageTask", postData, function (responseData) {
                if (responseData.Result) {
                    //刷新页面
                    $('#DataGridOtherChange').datagrid("load", {
                        ChageTaskID: $("input[id$='HDChangeDateID']").val(),
                        _t: new Date().getTime()
                    });
                }
                else {
                    $('#DataGridOtherChange').datagrid("load", {
                        ChageTaskID: $("input[id$='HDChangeDateID']").val(),
                        _t: new Date().getTime()
                    });
                }
            }, function () {
                alert("出现网络错误");
            });


        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <asp:HiddenField ID="HDChangeDateID" runat="server" />

    <div class="container form-horizontal">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">申请人</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtApplicant" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
            </div>

            <label for="inputPassword3" class="col-sm-2 control-label">申请时间</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtApplicantDate" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">任务名称</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtTask" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">原计划时间</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtOldPlanDate" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
            </div>

            <label for="inputPassword3" class="col-sm-2 control-label">新计划时间</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtNewPlanDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">变更原因</label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="DDLChangeType" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="DDLChangeType_SelectedIndexChanged">
                            <asp:ListItem Text="内部原因" />
                            <asp:ListItem Text="客户原因" />
                            <asp:ListItem Text="供方原因" />
                        </asp:DropDownList>
                    </div>


                    <div class="col-sm-3">
                        <asp:DropDownList ID="DDLChangeTypeSub" runat="server" CssClass="form-control">
                            <asp:ListItem Text="内部设变/变更 " />
                            <asp:ListItem Text="内部进度延后" />
                            <asp:ListItem Text="内部工装品质问题" />
                            <asp:ListItem Text="设备进度延后" />
                            <asp:ListItem Text="工厂生产现场准备不足" />
                            <asp:ListItem Text="节点评审不通过" />
                            <asp:ListItem Text="其他" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtChangeNode" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">变更记录</label>
            <div class="col-sm-10">
                <input class="btn btn-default" type="button" value="查看计划时间变更记录" onclick="OpenChangeRecord();" />
            </div>
        </div>

        <!--其他变更-->
        <div class="panel panel-primary ">
            <div class="panel-heading ">其他变更</div>
            <div class="panel-body form-horizontal nodeEvaluation-event" style="padding: 0">
                <table id="DataGridOtherChange"></table>
            </div>
        </div>
        <div style="margin-top: 0; text-align: right" class="clearfix">
            <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            <button class="btn btn-default" type="button" onclick="window.frameElement.cancelPopUp();">取消</button>
        </div>
        <!--其他变更end-->


        <div class="panel panel-primary ">
            <div class="panel-heading ">历史记录</div>
            <div class="panel-body form-horizontal nodeEvaluation-event" style="padding: 0">
                <table class="itemMessage-table itemMessage-tableHistoryRecord">
                    <thead>
                        <tr>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 10%">操作人</th>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 15%">过程</th>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 20%">步骤</th>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 15%">操作</th>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 20%">时间</th>
                            <th class="itemMessage-table-thead2 itemMessage-table-theadHistory" style="width: 30%">审批意见</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a>张三</a></td>
                            <td>计划时间变更</td>
                            <td>责任人发起</td>
                            <td>发起</td>
                            <td>2016/10/10 9:08:35</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><a>李四</a></td>
                            <td>计划时间变更</td>
                            <td>项目经理审批</td>
                            <td>审批通过</td>
                            <td>2016/10/30 9:08:35</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><a>王五</a></td>
                            <td>计划时间变更</td>
                            <td>项目经理的部门经理审批</td>
                            <td>审批通过</td>
                            <td>2016/10/10 9:08:35</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>


    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    计划时间变更
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    计划时间变更
</asp:Content>

