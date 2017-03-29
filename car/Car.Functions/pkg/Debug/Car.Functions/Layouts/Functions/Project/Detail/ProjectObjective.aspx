<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectObjective.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.ProjectObjective" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script src="/_layouts/15/UI/jquery-easyui/jquery.easyui.min.js"></script>
    <link href="/_layouts/15/UI/jquery-easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/_layouts/15/UI/jquery-easyui/themes/icon.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>
    <script src="/_layouts/15/UI/jquery-easyui/src/datagrid-groupview.js"></script>
    <script>



        $(function () {
            //_columns在后台生成

            //状态栏进行格式自定义
            //$.each(_columns, function () {
            //    if (this.field == "Status") {
            //        this.formatter = function (value, row, index) {
            //            if (value.toLowerCase() == "g") {
            //                return '<div class="statues-choice-green"></div>';
            //            } else if (value.toLowerCase() == "r") {
            //                return '<div class="statues-choice-red"></div>';
            //            }
            //        }
            //    }

            //    //节点完成时，责任人编辑
            //    if (this.field == "Actual") {
            //        this.editor = { type: "numberbox", options: { precision: 1 } };
            //    }
            //    //项目初始化的时候，项目经理编辑
            //    if (this.field == "Target") {
            //        this.editor = { type: "numberbox", options: { precision: 1 } };
            //    }
            //});
            //var col = [_columns];

            //数据表通用设置
            var gridoption = {
                idField: "ID",
                treeField: "Project",
                nowrap: false,

                nowrap: false,
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetProjectTarget",
                queryParams: {
                    pid: $.OpzoonGetQueryParam("pid"),
                    _t: new Date().getTime()
                },
                rowStyler: function (rowData) {
                    if (rowData) {
                        if (rowData["ProjectLevel"] == "Gate") {
                            return "background-color:#0560b4;    line-height: 35px;height:35px;color:white;font-weight:bold";
                        }
                        else if (rowData["ProjectLevel"] == "Dimension") {
                            return "background-color: #f2f2f2;    line-height: 30px;height:30px;color:#0560b4;font-weight:bold";
                        } else {
                            return "height:30px";
                        }
                    }

                },
                columns: [[
                    { field: "Project", title:  '<%=GetFieldTitle("Project")%>', width: "15%", formatter: function (val) { return val.Label; } },
                    {
                        field: "Description", title: '<%=GetFieldTitle("Project")%>', width: "50%", formatter: function (val) { return val.Label; }, formatter: function (val, rowData, index) {
                            if (rowData.ProjectLevel == "Gate") {
                                return "";
                            } else {
                                if (val) {
                                    return val.Label;
                                } else {
                                    return "";
                                }
                            }
                        }
                    },
                    {
                        field: "InCharge", title:  '<%=GetFieldTitle("InCharge")%>', width: "15%", formatter: function (val) { return val.Label; }, formatter: function (val, rowData, index) {
                            if (rowData.ProjectLevel == "Gate") {
                                return "";
                            } else {
                                if (val) {
                                    return val.Label;
                                } else {
                                    return "";
                                }
                            }
                        }
                    },
                    {
                        field: "Target", title:  '<%=GetFieldTitle("Target")%>', width: "5%", editor: { type: "numberbox", options: { precision: 1 } }, formatter: function (val, rowData, index) {
                            if (rowData.ProjectLevel == "Gate") {
                                return "";
                            } else {
                                return val;
                            }
                        }
                    },
                    {
                        field: "Actual", title:  '<%=GetFieldTitle("Actual")%>', width: "5%", editor: { type: "numberbox", options: { precision: 1 } }, formatter: function (val, rowData, index) {
                            if (rowData.ProjectLevel == "Gate") {
                                return "";
                            } else {
                                return val;
                            }
                        } },
                    {
                        field: "Status", title: '<%=GetFieldTitle("Status")%>', width: "10%", formatter: function (val, rowData, index) {
                            if (rowData.ProjectLevel == "Gate") {
                                return "";
                            }
                            return '<img src="/_layouts/15/functions/images/' + val + '.png" style="height:22px;">';
 
                        }
                    }
                ]],
                onBeforeEdit: function (rowData) {
                    //这里进行编辑限制，只有责任人可以编辑，对项目经理全程放行TODO
                    //var _tag = false;
                    //$.each(row.ResponsiblePerson, function () {
                    //    if (this.Key == _spPageContextInfo.userId) {
                    //        _tag = true;
                    //        return false;
                    //    }
                    //});
                    //return _tag;

                    if (rowData) {
                        if (rowData["ProjectLevel"] == "Gate") {
                            return false;
                        }
                        else if (rowData["ProjectLevel"] == "Dimension") {
                            return false;
                        } else {

                            return true;

                        }
                    }

                },
                onAfterEdit: function (row, changes) {

                },
                onLoadSuccess: function () {
                    $.parser.parse();
                }
            };



            $('#gridGate1').treegrid($.extend(gridoption, {
                queryParams: {
                    pid: $.OpzoonGetQueryParam("pid"),
                    _t: new Date().getTime()
                }
            }));

        });


        $(function () {

            //编辑按钮
            $("#btnEdit").linkbutton({
                onClick: function () {
                    var notifyId = SP.UI.Notify.addNotification("稍等，系统正在处理!", true);

                    //获取数据表下的数据
                    var _gates = $("#gridGate1").treegrid("getRoots");
                    //把数据表下的数据变成可编辑状态


                    $.each(_gates, function (index, ele) {
                        var _nodes = $("#gridGate1").treegrid("getChildren", this.ID);
                        $.each(_nodes, function () {
                            var _tasks = $("#gridGate1").treegrid("getChildren", this.ID);
                            $.each(_tasks, function () {
                                $("#gridGate1").treegrid("beginEdit", this.ID);
                            });
                        });
                    });
                    $("#btnEdit").linkbutton("disable");
                    $("#btnSave").linkbutton("enable");

                    SP.UI.Notify.removeNotification(notifyId);
                }
            });

            //保存按钮
            $("#btnSave").linkbutton({
                disabled: true,
                onClick: function () {
                    SP.UI.Notify.addNotification("稍等，系统正在保存数据!", true);
                    var _flg = 0;

                    var dd = [];
                    //UI保存数据表所有的数据
                    var _gates = $("#gridGate1").treegrid("getRoots");
                    $.each(_gates, function (index, ele) {
                        var _nodes = $("#gridGate1").treegrid("getChildren", this.ID);
                        $.each(_nodes, function () {
                            var _tasks = $("#gridGate1").treegrid("getChildren", this.ID);
                            $.each(_tasks, function () {
                                $("#gridGate1").treegrid("endEdit", this.ID);
                                dd.push(this);
                            });
                        });
                    });

                    //保存数据表数据到服务器中
                    //  var data = $("#gridGate1").treegrid("getData");
                    ChangeObjective(dd);

                    //按钮状态
                    $("#btnEdit").linkbutton("enable");
                    $("#btnSave").linkbutton("disable");
                }
            });


        });


        function ChangeObjective(targets) {
            var postData = {};
            postData.targets = targets;
            postData.pid = $.OpzoonGetQueryParam("pid"),
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("ChageTargets", postData, function (responseData) {
                if (responseData.Result) {
                    //刷新页面
                    GoToPage(window.location.href);
                }
                else {
                    GoToPage(window.location.href);
                }
            }, function () {
                alert("出现网络错误");
            });
        }
    </script>
    <style>
        .textbox-text {
            height: 24px !important;
        }

        .panel-body {
            padding: 0 !important;
        }

        #DeltaPlaceHolderMain {
            padding: 0 !important;
            overflow: hidden !important;
        }


        /*treegrid 图标*/
        .tree-icon {
            display: none !important;
        }
         
    </style>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <!--页面顶部-->
    <table class="projectObjective-table" style="width: 100%;">
        <thead>
            <tr style="background-color: #0560b4">
                <th colspan="4" style="padding: 2px 30px 2px 15px; height: 40px">
                    <span style="font-size: 16px; color: white"><%=GetTitle("ProjectObjective") %></span>
                </th>
                <th colspan="5" style="text-align: right; padding: 2px 30px 2px 15px; height: 40px">

                    <a id="btnEdit"><%=GetTitle("Edit") %></a>
                    <a id="btnSave"><%=GetTitle("Save") %></a>
                </th>
            </tr>

        </thead>
    </table>
    <!--页面顶部end-->

    <!--手风琴控件-->
    <table class="nodeManagement-gateUl" style="width: 100%">
        <tbody>
            <table id="gridGate1"></table>
        </tbody>
    </table>
    <!--手风琴控件end-->
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    <%=GetTitle("ProjectObjective") %>
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    <%=GetTitle("ProjectObjective") %>
</asp:Content>
