<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenuUserControl.ascx.cs" Inherits="Car.Functions.LeftMenu.LeftMenuUserControl" %>
<style>

   

    #s4-titlerow {
        display: none!important;
    }

    #contentRow {
        padding-top: 0!important;
    }



    #main-nav {
        margin-left: 1px;
    }

        #main-nav.nav-tabs.nav-stacked > li > a {
            padding: 10px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A515B;
            background: #E9E9E9;
            background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
            background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
            border: 1px solid #D5D5D5;
            border-radius: 4px;
        }

            #main-nav.nav-tabs.nav-stacked > li > a > span {
                color: #4A515B;
            }

            #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
                color: #FFF;
                background: #3C4049;
                background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
                background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
                border-color: #2B2E33;
            }

                #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
                    color: #FFF;
                }

        #main-nav.nav-tabs.nav-stacked > li {
            margin-bottom: 4px;
        }

    /*定义二级菜单样式*/
    .secondmenu a {
        font-size: 10px;
        color: #4A515B;
        text-align: left;
    }

    .navbar-static-top {
        background-color: #003366;
        margin-bottom: 5px;
    }

    .navbar-brand {
        background: url('') no-repeat 10px 8px;
        display: inline-block;
        vertical-align: middle;
        padding-left: 10px;
        color: #fff;
    }
</style>
<script>
    function mainJumpUrl() {
        document.getElementById('iframe_two').src = "issue/已关闭的高风险.html";
    }

    function opene(e) {
        if ($(e).attr("data-url")) {
            document.getElementById('mainFrame').src = $(e).attr("data-url");
        }
    
        return false;
    }
</script>

<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
    <asp:Repeater ID="RepeaterFirstLevel" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
        <ItemTemplate>
            <li>
                <a href='#<%# Eval("Code")%> ' class="nav-header collapsed" data-toggle="collapse" data-url='<%#Eval("Url")%>' onclick='opene(this)'>
                    <i class='<%#Eval("Icon") %>'></i><%#Eval("Title") %> <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    <span class="badge badge-info" style="background: #009999"><%#Eval("OverTime") %></span>
                    <span class="badge badge-info" style="background: #FF0000"><%#Eval("Danger") %></span>
                </a>


                <ul id='<%#Eval("Code") %>' class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <asp:Repeater ID="SubRepeater" runat="server">
                        <ItemTemplate>
                            <li><a href="javascript:void(0);" data-url='<%#Eval("Url")%>' onclick='opene(this)'><i class='<%#Eval("Icon") %>'></i><%#Eval("Title") %>
                                <span class="badge badge-info" style="background: #009999"><%#Eval("OverTime") %></span>
                                <span class="badge badge-info" style="background: #FF0000"><%#Eval("Danger") %></span>
                            </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </li>
        </ItemTemplate>
    </asp:Repeater>

</ul>
