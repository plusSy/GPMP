<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomNavBarControl.ascx.cs" Inherits="Car.Functions.ControlTemplates.Functions.CustomNavBarControl" %>
<!--bootstrap-->
<script src="/_layouts/15/UI/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/_layouts/15/UI/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/_layouts/15/UI/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
<!--[if lt IE 9]> 
        <script src="/_layouts/15/UI/html5shiv/html5shiv.js"></script>
        <script src="/_layouts/15/UI/respond/respond.min.js"></script> 
  <![endif]-->

<style>
    /*左侧导航*/
    #sideNavBox {
        width: 220px;
        margin-left: 0px;
        margin-right: 0px;
    }

    #contentBox {
        margin-left: 230px;
        margin-right: 0px;
    }
    /*窗体打开时左侧距离*/
    .ms-dialog #contentBox {
        margin-left: 0px;
    }

    .ms-cui-dd-arrow-button {
        padding-left: 0px;
        margin-left: 0px;
    }

    .ms-cui-dd-text, input.ms-cui-cb-input {
        padding: 0px 7px 2px;
        height: 19px;
    }

    .ms-cui-img-5by3 {
        width: 5px;
        height: 5px;
    }


    .ms-dlgTitleBtns {
        margin-top: 0;
        margin-right: 0;
    }

    /*中间行*/
    #contentRow {
        padding-top: 5px !important;
    }
    .ms-dialog #contentRow {
        padding-top: 5px !important;
    }
    #s4-titlerow {
        display: none !important;
    }
    /*设置顶部背景色*/
    #DeltaPlaceHolderLeftNavBar {
        display: none;
    }

    .o365cs-base.o365cs-topnavBGColor-2 {
        background-color: #0560b4;
    }

    .o365cs-base .o365cs-topnavLinkBackground-2 {
        background-color: #0560b4;
    }

    div.ms-cui-TabRowRight {
        display: none !important;
    }

    /*显示窗体宽度设置100%*/
    .ms-core-tableNoSpace {
        width: 100%;
    }

    #DeltaPlaceHolderMain {
        border: solid 1px #cbcbcb;
        padding-top: 10px;
        padding-right: 5px;
        padding-left: 10px;
    }



    /*_left-nav-li针对非下拉的样式处理，如有下拉样式如left-nav-li*/
    .homeContainer {
        width: 1340px;
        margin: 0 auto;
        overflow: hidden;
    }

    .header {
        width: 1340px;
        height: 110px;
        background-color: #0560b4;
        overflow: hidden;
    }

    .header-logo {
        width: 170px;
        height: 100px;
        padding-left: 20px;
        padding-top: 5px;
        float: left;
    }

    .header-logo-img {
        width: 170px;
        height: 100px;
    }

    .header-title {
        float: left;
        height: 110px;
        line-height: 110px;
        color: #ffffff;
        font-size: 25px;
        font-weight: bolder;
        padding-left: 25px;
    }

    .left-nav {
        width: 100%;
        background-color: #0560b4;
        height: 600px;
        border-top: 1px solid #2b2e37;
        color: #ffffff;
        float: left;
    }

    .left-second-nav {
        padding: 0 20px;
    }

    .left-second-nav-ul {
        display: block;
        color: #c2c2c2;
    }

    .left-nav-ul, .left-second-nav-ul {
        list-style-type: none;
        text-align: left;
        padding: 0;
        margin: 0;
    }

    ._left-nav-li {
        padding-left: 20px;
        width: 225px !important;
    }

        ._left-nav-li:hover {
            background-color: #2b2e37;
        }

    .left-nav-li {
        width: 100%;
        line-height: 40px;
        font-size: 14px;
        overflow: hidden;
        cursor: pointer;
    }

    .left-first-nav {
        overflow: hidden;
        padding: 0 20px;
    }

        .left-first-nav:hover {
            background-color: #2b2e37;
        }

    .left-second-nav-li:hover {
        color: #ffffff;
        -webkit-transition: 0.5s linear;
        -moz-transition: 0.5s linear;
        -ms-transition: 0.5s linear;
        -o-transition: 0.5s linear;
        transition: 0.5s linear;
    }



    .left-nav-liTitle a {
        color: #c2c2c2;
        text-decoration: none;
    }

        .left-nav-liTitle a:hover {
            color: #ffffff;
        }

        .left-nav-liTitle a:visited {
            color: #c2c2c2;
        }


    .left-second-nav-li a {
        color: #c2c2c2;
        text-decoration: none;
    }

        .left-second-nav-li a:hover {
            color: #ffffff;
        }

        .left-second-nav-li a:visited {
            color: #c2c2c2;
        }

    .left-nav-liTitle {
        float: left;
    }

    .left-nav-liIcon {
        float: right;
        padding-right: 10px;
    }

    .left-nav-Icon {
        width: 20px;
        height: 20px;
        background-color: #eeeeee;
        font-size: 12px;
        border-radius: 20px;
        padding: 5px;
    }

    .icon-int {
        color: #0560b4;
    }

    .icon-out {
        color: red;
    }

    .current {
        background-color: #2b2e37;
    }

    .homePage-con {
        width: 1095px;
        float: right;
    }
</style>

<script>
    $(function () {
        //修改站点名
        $(".o365cs-nav-header16 .o365cs-nav-leftAlign .o365cs-nav-topItem").eq(0).hide();
        $(".o365cs-nav-header16 .o365cs-nav-appTitle .o365cs-nav-brandingText").text("Global Project Management Platform");
        $(".o365cs-nav-header16 .o365cs-nav-appTitle ").attr("href", "/");
        //修改logo
        $(".o365cs-nav-bposLogo").html('<img src="/_layouts/15/ui/minth_logo.jpg" style="height: 49px;">')
    });

</script>
<script>
    function mainJumpUrl() {
        document.getElementById('iframe_two').src = "issue/已关闭的高风险.html";
    }

    function opene(e) {
        debugger;
        if ($(e).attr("data-url") && $(e).attr("data-url") != "/") {



            var _url = $(e).attr("data-url");
            STSNavigate(_url);
        }

        return false;
    }

    $(function () {
        $(".left-nav-li").on("click", function () {

            $(this).find("")


            if ($(this).find("ul").css("display") == "none") {
                $(this).find("ul").slideDown(1000);
            } else {
                $(this).find("ul").slideUp(500);
                $(this).find("ul").css("display:block");
            };
        });
        $(".left-second-nav-li").on("click", function (event) {
            event.stopPropagation();
        })

    });
</script>

<div class="left-nav">
    <ul class="left-nav-ul">
        <asp:Repeater ID="RepeaterFirstLevel" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
            <ItemTemplate>
                <li class="left-nav-li">

                    <div class="left-first-nav">
                        <span class="left-nav-liTitle">
                            <a href="javascript:void(0);" data-url='<%#Eval("Url")%>' onclick='opene(this)'>
                                <%#Eval("Title") %>
                                          
                            </a>
                        </span>
                        <div class="left-nav-liIcon">
                            <span class="left-nav-Icon icon-int" style='display: <%#Eval("IsShow")%>'><%#Eval("OverTime") %></span>
                            <span class="left-nav-Icon icon-out" style='display: <%#Eval("IsShow")%>'><%#Eval("Danger") %></span>
                        </div>
                    </div>



                    <div class="left-second-nav">
                        <ul class="left-second-nav-ul" style="display: none">
                            <asp:Repeater ID="SubRepeater" runat="server">
                                <ItemTemplate>
                                    <li class="left-second-nav-li clearfix">
                                        <a href="javascript:void(0);" data-url='<%#Eval("Url")%>' onclick='opene(this)'>
                                            <%#Eval("Title") %>
                                          
                                        </a>
                                        <div class="left-nav-liIcon">
                                            <span class="left-nav-Icon icon-int" style='display: <%#Eval("IsShow")%>'><%#Eval("OverTime") %></span>
                                            <span class="left-nav-Icon icon-out" style='display: <%#Eval("IsShow")%>'><%#Eval("Danger") %></span>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>

    </ul>
</div>
