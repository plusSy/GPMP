<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeManagement.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.NodeManagement" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script src="/_layouts/15/UI/jquery-easyui/jquery.easyui.min.js"></script>
    <link href="/_layouts/15/UI/jquery-easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/_layouts/15/UI/jquery-easyui/themes/icon.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>
    <link href="/_layouts/15/functions/css/nodemanagement.css" rel="stylesheet"></link>
    <script src="/_layouts/15/functions/Script/moment/moment.min.js"></script>

    <script>

         
    </script>
    <style>
        .textbox-text {
            height: 24px !important;
        }

        .panel-body {
            padding: 0 !important;
        }


        /*treegrid 图标*/
        .tree-icon {
            display: none !important;
        }

        #DeltaPlaceHolderMain {
            padding: 0 !important;
            overflow: hidden !important;
        }

 
    </style>
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
            //    if (this.field == "PlanDate") {
            //        this.editor = { type: "datebox", options: { precision: 1 } };
            //    }

            //});


            //数据表通用设置
            var gridoption = {
                idField: "ID",
                treeField: "Project",
                nowrap: false,
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetTasks",
                queryParams: {
                    pid: $.OpzoonGetQueryParam("pid"),
                    _t: new Date().getTime()
                },
                rowStyler: function (rowData) {
                    if (rowData) {
                        if (rowData["ProjectLevel"] == "Gate") {
                            return "background-color:#0560b4;    line-height: 35px;height:35px;color:white;font-weight:bold";
                        }
                        else if (rowData["ProjectLevel"] == "Node") {
                            return "background-color: #f2f2f2;    line-height: 30px;height:30px;color:#0560b4;font-weight:bold";
                        } else {
                            return "height:30px";
                        }
                    }

                },
                columns: [[
                 {
                     field: "Project", title: '<%=GetFieldTitle("Project")%>', width: "29%", formatter: function (val, rowData, index) {
                         if (rowData["ProjectLevel"] == "Gate") {
                             return val.Label + '<button type="button" class="btn btn-default btn-xs"  onClick="OpenNodeReView(this);"  " data-taskid="' + rowData["ID"] + '" data-gate="' + val.Label + '" >节点评审</button>'
                         }
                         else if (rowData["ProjectLevel"] == "Node") {
                             if (val) {
                                 return val.Label;
                             } else {
                                 return "";
                             }
                         }
                         else {
                             return '<a href="javascript:void(0);" onClick="OpenTask(this);" data-listid="' + rowData["ListID"] + '" data-itemid="' + rowData["ID"] + '">' + val["Label"] + '</a>';
                         }
                     }
                 },
                 {
                     field: "InCharge", title: '<%=GetFieldTitle("InCharge")%>', width: "10%", formatter: function (val) {
                         if (val) {
                             return val.Label;
                         } else {
                             return "";
                         }
                     }
                 },
                 {
                     field: "ResponsiblePerson", title: '<%=GetFieldTitle("ResponsiblePerson")%>', width: "10%", formatter: function (val) {

                         if (val) {
                             return val[0].Value;
                         }
                         else {
                             return "";
                         }
                     }
                 },
                 {
                     field: "PlanDate", title: '<%=GetFieldTitle("PlanDate")%>', width: "10%", formatter: function (val) {
                         if (val) {
                             return moment(val).format("YYYY-MM-DD");
                         } else {
                             return "";
                         }
                         
                     }, editor: { type: "datebox", options: { parser: dateboxParser, formatter: dateboxFormatter } }
                 },
                 {
                     field: "CompleteDate", title: '<%=GetFieldTitle("CompleteDate")%>', width: "10%", formatter: function (val) {
                         if (val) {
                             return moment(val).format("YYYY-MM-DD");
                         } else {
                             return "";
                         }
                     }
                 },
                 {
                     field: "Project_Number", title: '<%=GetFieldTitle("Project_Number")%>', width: "10%", formatter: function (val, rowData, index) {
                         if (rowData["ProjectLevel"] != "Task") {
                             return "";
                         } else {
                             return '<img src="/_layouts/15/functions/images/pine.png" style="width: 20px;height: 20px;" onClick="ChangeTaskTime(this)" data-taskid="' + rowData.ID + '"/> ';
                         }
                     }
                 },
                     {
                         field: "Disable", title: '<%=GetFieldTitle("Disable")%>', width: "10%", formatter: function (val, rowData, index) {
                             if (rowData["ProjectLevel"] != "Task") {
                                 return "";
                             }

                             if (val) {
                                 return '<input class="easyui-switchbutton" checked data-options="onChange:switchChange" data-rowid="' + rowData.ID + '"/>';
                             } else {
                                 return '<input class="easyui-switchbutton"  data-options="onChange:switchChange"  data-rowid="' + rowData.ID + '"/>';
                             }
                         }
                     },
                         {
                             field: "Status", title: '<%=GetFieldTitle("Status")%>', width: "10%", formatter: function (val) {

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
                        else if (rowData["ProjectLevel"] == "Node") {
                            return false;
                        } else {
                            if (rowData["Disable"]) {
                                return true;
                            } else { return false; }
                        }
                    }

                },
                onAfterEdit: function (row, changes) {

                    if (changes.PlanDate) {
                        row.PlanDate = $.GetJSONDate(changes.PlanDate);
                    }
                }, onLoadSuccess: function () {
                    $.parser.parse();
                }
            };



            $('#gridGate1').treegrid($.extend(gridoption, {
                queryParams: {
                    pid: $.OpzoonGetQueryParam("pid"),
                    _t: new Date().getTime()
                }
            }));


            $("#btnEdit").linkbutton({
                onClick: function () {

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
                    //    var data = $("#gridGate1").treegrid("getData");
                    ChangeTask(dd);
                    //按钮状态
                    $("#btnEdit").linkbutton("enable");
                    $("#btnSave").linkbutton("disable");
                }
            });


        });

        function OpenTask(e) {
            var _listID = $(e).data("listid");
            var _itemID = $(e).data("itemid");
            var url = "/_layouts/15/listform.aspx?PageType=4&ListId=" + encodeURIComponent(_listID) + "&ID=" + _itemID;

            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                SP.UI.ModalDialog.OpenPopUpPage(url, function () {
                    //关闭窗口调用
                });
            });
        }
        //修改节点事件
        function ChangeTask(tasks) {
            var postData = {};
            postData.tasks = tasks;
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("ChageTask", postData, function (responseData) {
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

        //禁用状态按钮事件
        function switchChange(checked) {

            var rowID = $(this).data("rowid");
            $("#gridGate1").treegrid("update", { id: rowID, row: { Disable: checked } });
            var _row = $("#gridGate1").treegrid("find", rowID);
            $.parser.parse();

            var postData = {};
            postData.tasks = [_row];
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("ChageTask", postData, function (responseData) {
                if (responseData.Result) {
                    //刷新页面
                    //  GoToPage(window.location.href);
                }
                else {
                    //     GoToPage(window.location.href);
                }
            }, function () {
                alert("出现网络错误");
            });
        }

        //节点事件变更
        function ChangeTaskTime(e) {
            var _taskID = $(e).data("taskid");

            var url = "/_layouts/15/functions/project/detail/PlandateTimeChange.aspx?taskID=" + _taskID + "&pid=" + $.OpzoonGetQueryParam("pid");

            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                SP.UI.ModalDialog.OpenPopUpPage(url, function () {
                    //关闭窗口调用
                }, 900);
            });
        }

        function OpenNodeReView(e) {
		debugger;
            var _taskID = $(e).data("taskid");
            var _gate = $(e).data("gate");
            var url = "/_layouts/15/functions/project/detail/NodeReview.aspx?taskID=" + _taskID + "&pid=" + $.OpzoonGetQueryParam("pid") + "&gate=" + encodeURIComponent(_gate);

            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                SP.UI.ModalDialog.OpenPopUpPage(url, function () {
                    //关闭窗口调用
                }, 900);
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <!--页面顶部-->
    <table class="projectObjective-table" style="width: 100%;">
        <thead>
            <tr style="background-color: #0560b4">
                <th colspan="4" style="padding: 2px 30px 2px 15px; height: 40px">
                    <span style="font-size: 16px; color: white">Gate-<%=GetTitle("Node") %>-<%=GetTitle("Task") %></span>
                </th>
                <th colspan="5" style="text-align: right; padding: 2px 30px 2px 15px; height: 40px">
                    <a id="btnPlanDateChangeRecord">计划时间变更记录</a>
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
    节点管理
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    节点管理
</asp:Content>

