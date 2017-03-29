<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryListUserControl.ascx.cs" Inherits="Car.Functions.QueryList.QueryListUserControl" %>

<SharePoint:ScriptLink Name="clienttemplates.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="clientforms.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="clientpeoplepicker.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="autofill.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="sp.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="sp.runtime.js" runat="server" LoadAfterUI="true" Localizable="false" />
<SharePoint:ScriptLink Name="sp.core.js" runat="server" LoadAfterUI="true" Localizable="false" />
<script type="text/javascript">
    $(document).ready(function () {

        // Specify the unique ID of the DOM element where the// picker will render.
        //    initializePeoplePicker('peoplePickerDiv');
    });

    function initializePeoplePicker(peoplePickerElementId) {

        var schema = {};
        schema['PrincipalAccountType'] = 'User,DL,SecGroup,SPGroup';
        schema['SearchPrincipalSource'] = 15;
        schema['ResolvePrincipalSource'] = 15;
        schema['AllowMultipleValues'] = true;
        schema['MaximumEntitySuggestions'] = 50;
        schema['Width'] = '280px';
        schema['Height'] = '55px';

        this.SPClientPeoplePicker_InitStandaloneControlWrapper(peoplePickerElementId, null, schema);
    }

    function getUserInfo() {

        var peoplePicker = this.SPClientPeoplePicker.SPClientPeoplePickerDict.peoplePickerDiv_TopSpan;

        var users = peoplePicker.GetAllUserInfo();
        var userInfo = '';
        for (var i = 0; i < users.length; i++) {
            var user = users[i];
            for (var userProperty in user) {
                userInfo += userProperty + ':  ' + user[userProperty] + '<br>';
            }
        }
        // $('#resolvedUsers').html(userInfo);

        var keys = peoplePicker.GetAllUserKeys();
        // $('#userKeys').html(keys);
        document.getElementById('Status').value = keys;
    }




</script>

<div class=" container-fluid form-inline">
    <div class="row ">
        <div class="col-md-4">
            <div class="form-group">
                <label for="LinkTitle">项目编号</label>
                <input type="text" class="form-control input-sm" id="LinkTitle" placeholder="Jane Doe">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="CreateUser">汽车集团</label>
                <input type="text" class="form-control input-sm" id="CreateUser" placeholder="Jane Doe" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="Status">项目经理</label>
                <input type="text" class="form-control input-sm" id="Status" placeholder="Jane Doe" />
                <%--   <div id="peoplePickerDiv" style="height: 22px" >--%>
            </div>
        </div>
    </div>


    <div class="row" style="margin-top: 10px">
        <div class="col-md-4">
            <div class="form-group">
                <label for="exampleInputName2">目前阶段</label>
                <input type="text" class="form-control input-sm" id="exampleInputName2" placeholder="Jane Doe">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="exampleInputName2">
                    任务状态 
                </label>
                <input type="text" class="form-control input-sm" id="exampleInputName2" placeholder="Jane Doe">
            </div>
        </div>
        <div class="col-md-4">
            <input class="btn btn-default btn-sm" type="button" value="查询" id="btnQuery" />
            <input class="btn btn-default btn-sm" type="button" value="清空">
        </div>
    </div>
</div>
<script>

    $(function () {
        $("#btnQuery").click(function () {

            TitleFilter();
        });
    });

    function TitleFilter() {
    
        var hasName = "InplviewHash" + _SPHelper.List.GetListViewID().replace("{", '').replace("}", "").toLowerCase();
        var ff = [];
        $(".form-control").each(function () {
            if ($(this).val()) {
                ff.push({
                    "FilterField": $(this).attr("ID"),
                    "FilterValue": $(this).val(),
                    "FilterOp": "Contains"
                });
            }
        });
        //#InplviewHash76e038bc-4e7f-4909-95a9-6367e6e43b40=FilterField1%3DLinkTitle-FilterValue1%3Das
      //  #InplviewHash76e038bc-4e7f-4909-95a9-6367e6e43b40=FilterField1%3DLinkTitle-FilterValue1%3Dasdf
 
        var q = "";
        for (var i = 0; i < ff.length; i++) {
            var ind = i + 1;
            if (ind != 1) {
                q += "-";
            }

            q += "FilterField" + ind  + "=" + ff[i]["FilterField"];
            q += "-";
            q +=  "FilterValue" + ind  + "=" + ff[i]["FilterValue"];
            q += "-";
            q +=  "FilterOp" + ind + "=" + ff[i]["FilterOp"];
        }

        var encod = encodeURIComponent(q);

        window.location.hash = hasName + "=" + encod;
    }

</script>
