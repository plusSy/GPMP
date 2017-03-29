<%@ Assembly Name="Car.Functions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=f4d28ff3717c3499" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeReview.aspx.cs" Inherits="Car.Functions.Layouts.Functions.Project.Detail.NodeReview" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

    <script src="/_layouts/15/UI/jquery-easyui/jquery.easyui.min.js"></script>
    <link href="/_layouts/15/UI/jquery-easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="/_layouts/15/UI/jquery-easyui/themes/icon.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/CoreScript.js"></script>
    <script src="/_layouts/15/functions/WCFCallMethod.js"></script>
    <link href="/_layouts/15/functions/css/nodemanagement.css" rel="stylesheet"></link>
    <script src="/_layouts/15/functions/Script/moment/moment.min.js"></script>
    <link href="/_layouts/15/UI/switch/bootstrap-switch.min.css" rel="stylesheet" />
    <script src="/_layouts/15/UI/switch/bootstrap-switch.min.js"></script>
    <link href="/_layouts/15/functions/Script/date/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="/_layouts/15/functions/Script/date/js/bootstrap-datetimepicker.min.js"></script>
    <link href="/_layouts/15/functions/Css/nodeReview.css" rel="stylesheet" />
    <script src="/_layouts/15/UI/jquery-easyui/src/datagrid-groupview.js"></script>
    <style>
        .datagrid .panel-body {
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
            $('#DataGridNodeReveiw').datagrid({
                view: groupview,
                groupField: "_Dimension",
                groupFormatter: function (value, rows) {
                    return value;
                },
                singleSelect: true,

                rowStyler: function () {
                    return "height:30px; ";
                },
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetTaskReviewTask",
                queryParams: {
                    gate: decodeURIComponent($.OpzoonGetQueryParam("gate")),
                    pid: $.OpzoonGetQueryParam("pid"),
                    _t: new Date().getTime()
                },
                columns: [[
                  { field: 'Project', title: '要素', width: "27%", formatter: function (val) { if (val) { return val.Label } else { return ""; } } },
                  { field: 'InCharge', title: '评价人员', width: "10%", formatter: function (val) { if (val) { return val.Label } else { return ""; } } },
                  {
                      field: 'Proportion', title: '占比%', width: "6%", formatter: function (val) {
                          return val * 100;
                      }
                  },
                  {
                      field: 'Score', title: '得分', width: "6%", editor: {
                          type: "combobox", options: {
                              valueField: 'label',
                              textField: 'value',
                              data: [{
                                  label: '0',
                                  value: '0'
                              }, {
                                  label: '5',
                                  value: '5'
                              }, {
                                  label: '10',
                                  value: '10'
                              }, {
                                  label: 'NB',
                                  value: 'NB'
                              }]
                          }
                      }
                  },
                  {
                      field: 'Status', title: '状态', width: "7%", formatter: function (val) {
                          return '<img src="/_layouts/15/functions/images/' + val + '.png" style="height:22px;">';
                      }
                  },
                  { field: 'WeightedScore', title: '加权得分', width: "8%" },
                  { field: 'ProblemDescription', title: '问题描述', width: "27%", editor: { type: "textbox", options: { multiline: true } } },
                  {
                      field: 'Problems', title: '提示', width: "9%", formatter: function (value) {
                          return '<a href="javascript:void(0);" title="' + value.Label + '" class="easyui-tooltip" style=" "><img src="/_layouts/15/functions/images/gantan-icno.png" style="width:20px;height:20px;"/></a>';

                      }
                  }
                ]],
                onAfterEdit: function (index, row, changes) {
                },
                onLoadSuccess: function () {
                    $.parser.parse();
                    var e = $('#DataGridNodeReveiw').datagrid("getRows");
                    var _jiaquan = 0;
                    var _shijie = 0;
                    var _cou = 0;
                    $.each(e, function () {
                        if ($.isNumeric(this["Score"])) {
                            _cou++;
                            _shijie += parseInt(this["Score"]);
                        }
                        if ($.isNumeric(this["WeightedScore"])) {
                            _jiaquan += parseInt(this["WeightedScore"]);
                        }
                    });
                    var pinjia = _jiaquan / _cou;

                    $("#PingjiaScore").text(pinjia);
                    if (pinjia >= 85) {
                        $("#PingjiaLevel").text("A");
                    }
                    else if (pinjia >= 70 && pinjia < 85) {
                        $("#PingjiaLevel").text("B");
                    }
                    else {
                        $("#PingjiaLevel").text("C");
                    }
                }
            });


            $('#DataGridUncomplete').datagrid({
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetTaskReviewTaskUncomplete",
                queryParams: {
                    review: $("input[id$='HDReviewID']").val(),
                    _t: new Date().getTime()
                },
                columns: [[
                    { field: 'Title', title: '未完成事项', width: "20%" },
                    { field: 'Issue', title: '风险度', width: "20%" },
                    { field: 'ActionPlan', title: '行动计划', width: "20%" },
                    { field: 'ResponsiblePerson', title: '责任人', width: "20%", formatter: function (val) { if (val) { return val[0].Value; } } },
                    {
                        field: 'EndDate', title: '截止日期', width: "10%", formatter: function (val) {
                            return moment(val).format("YYYY-MM-DD");
                        }
                    },
                    {
                        field: 'ID', title: '<img src="/_layouts/15/functions/images/add-icno.png" alt="" style="width: 18px; height: 18px; cursor: pointer;" onClick="addUnComplete()">', width: "10%", formatter: function (val) {
                            return ' <img src="/_layouts/15/functions/images/close-icno.png" alt="" style="width: 20px; height: 20px; cursor: pointer;margin-left: 3px;" onClick="DeleteUnComplete(' + val + ');" />';
                        }
                    }
                ]]
            });

            $('#DataGridSupport').datagrid({
                method: "get",
                url: "/_vti_bin/Car/PortalService.svc/GetTaskReviewTaskSupport",
                queryParams: {
                    review: $("input[id$='HDReviewID']").val(),
                    _t: new Date().getTime()
                },
                columns: [[
                    { field: 'Title', title: '需支持的项目', width: "20%" },
                    { field: 'ResponsiblePerson', title: '责任人', width: "20%", formatter: function (val) { if (val) { return val[0].Value; } } },
                    { field: 'Replay', title: '回复', width: "20%" },
                    { field: 'Note', title: '备注', width: "30%" },
                    {
                        field: 'ID', title: '<img src="/_layouts/15/functions/images/add-icno.png" alt="" style="width: 18px; height: 18px;" onClick="addsupport()">', width: "10%", formatter: function (val) {
                            return ' <img src="/_layouts/15/functions/images/close-icno.png" alt="" style="width: 20px; height: 20px; cursor: pointer;" onClick="Deletesupport(' + val + ');" />';
                        }
                    }
                ]]
            });


            $('#DataGridHistory').datagrid({
                url: 'datagrid_data.json',
                columns: [[
                    { field: 'code6', title: '操作人', width: "20%" },
                       { field: 'code5', title: '过程', width: "20%" },
                          { field: 'code4', title: '步骤', width: "10%" },
                          { field: 'code3', title: '操作', width: "10%" },
                      { field: 'code3', title: '时间', width: "10%" },
                       { field: 'code3', title: '审批意见', width: "30%" }
                ]]
            });



            //编辑按钮
            $("#btnEdit").linkbutton({
                onClick: function () {
                    var e = $('#DataGridNodeReveiw').datagrid("getRows");
                    $.each(e, function () {
                        var _index = $('#DataGridNodeReveiw').datagrid("getRowIndex", this);
                        $('#DataGridNodeReveiw').datagrid("beginEdit", _index);
                    });
                    $("#btnEdit").linkbutton("disable");
                    $("#btnSave").linkbutton("enable");

                }
            });

            //保存按钮
            $("#btnSave").linkbutton({
                disabled: true,
                onClick: function () {

                    $('#DataGridNodeReveiw').datagrid("acceptChanges");
                    var e = $('#DataGridNodeReveiw').datagrid("getRows");

                    var postData = {};
                    postData.List = e;
                    $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("SaveTaskReviewTask", postData, function (responseData) {
                        if (responseData.Result) {
                            //刷新页面
                            $('#DataGridNodeReveiw').datagrid("reload");
                        }
                        else {
                            $('#DataGridNodeReveiw').datagrid("reload");
                        }
                    }, function () {
                        alert("出现网络错误");
                    });
                    //按钮状态
                    $("#btnEdit").linkbutton("enable");
                    $("#btnSave").linkbutton("disable");
                }
            });

        });


        function addUnComplete() {
            var _listID = '<%=uncompleteList%>';

            var url = "/_layouts/15/listform.aspx?PageType=8&ListId=" + encodeURIComponent(_listID);

            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                var options = {
                    url: url,
                    dialogReturnValueCallback: function () {
                        $('#DataGridUncomplete').datagrid("reload");
                    },
                    args: { reviewID: $("input[id$='HDReviewID']").val() }
                };

                SP.UI.ModalDialog.showModalDialog(options);

            });
        }


        function addsupport() {
            var _listID = '<%=supportList%>';

            var url = "/_layouts/15/listform.aspx?PageType=8&ListId=" + encodeURIComponent(_listID);


            SP.SOD.executeFunc('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', function () {
                var options = {
                    url: url,
                    dialogReturnValueCallback: function () {
                        $('#DataGridSupport').datagrid("reload");
                    },
                    args: { reviewID: $("input[id$='HDReviewID']").val() }
                };

                SP.UI.ModalDialog.showModalDialog(options);

            });
        }


        function DeleteUnComplete(itemid) {
            var _listID = '<%=uncompleteList%>';

            var postData = {};
            postData.ID = itemid;
            postData.List = _listID;
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("DeleteUnComplete", postData, function (responseData) {
                if (responseData.Result) {
                    //刷新页面
                    $('#DataGridUncomplete').datagrid("reload");
                }
                else {
                    $('#DataGridUncomplete').datagrid("reload");
                }
            }, function () {
                alert("出现网络错误");
            });
        }


        function Deletesupport(itemid) {
            var _listID = '<%=supportList%>';
            var postData = {};
            postData.ID = itemid;
            postData.List = _listID;
            $.WCFCallMethod("/_vti_bin/Car/PortalService.svc/").PostMethod("DeleteSupport", postData, function (responseData) {
                if (responseData.Result) {
                    //刷新页面
                    $('#DataGridSupport').datagrid("reload");
                }
                else {
                    $('#DataGridSupport').datagrid("reload");
                }
            }, function () {
                alert("出现网络错误");
            });

        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <asp:HiddenField ID="HDReviewID" runat="server" />

    <!--基本信息-->
    <div class="panel panel-primary ">
        <div class="panel-heading ">基本信息 </div>
        <div class="panel-body form-horizontal">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-1 control-label">标题</label>
                <div class="col-sm-11">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-1 control-label">申请人</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtApplicant" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
                <label for="inputPassword3" class="col-sm-2 control-label">申请时间</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtApplicantDate" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <!--基本信息end-->
    <!--节点评审-->
    <div class="panel panel-primary ">
        <div class="panel-heading ">
            Gate 1节点评审表单     <a id="btnEdit" >编辑</a><a id="btnSave">保存</a>
        </div>
        <div class="panel-body form-horizontal" style="padding: 0">
            <table id="DataGridNodeReveiw"></table>

            <div style="height: 30px; border: solid 1px #cbcbcb; margin-top: -20px;" class="container-fluid">
                <div class="row">
                    <div class="col-sm-2">评价得分：</div>
                    <div class="col-sm-4"><span id="PingjiaScore"></span></div>
                    <div class="col-sm-2">评价等级：</div>
                    <div class="col-sm-4"><span id="PingjiaLevel"></span></div>
                </div>
            </div>
        </div>
    </div>
    <!--节点评审end-->
    <!--支持项目-->
    <div class="panel panel-primary ">
        <div class="panel-heading ">未完成事项和需要支持事项</div>
        <div class="panel-body form-horizontal nodeEvaluation-event" style="padding: 0">
            <table id="DataGridUncomplete"></table>
            <table id="DataGridSupport"></table>
            
        </div>
    </div>
    <!--支持项目end-->
    <div style="margin-top: 0; text-align: right" class="clearfix">
                <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                <button class="btn btn-default" type="button" onclick="window.frameElement.cancelPopUp();">取消</button>
    </div>

    <!--历史记录-->
    <div class="panel panel-primary ">
        <div class="panel-heading ">历史记录</div>
        <div class="panel-body form-horizontal nodeEvaluation-event" style="padding: 0">
            <table id="DataGridHistory"></table>
        </div>
    </div>
    <!--历史记录end-->

</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    节点评审
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    节点评审
</asp:Content>
