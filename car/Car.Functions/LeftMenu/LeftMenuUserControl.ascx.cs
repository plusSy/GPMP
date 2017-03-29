using Microsoft.SharePoint;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Car.Functions.LeftMenu
{
    public partial class LeftMenuUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            List<MenuModel> dataSourse = new List<MenuModel>();

            SPWeb web = SPContext.Current.Site.RootWeb;
            SPList menuList = web.Lists.TryGetList("sys_function");
            if (menuList != null)
            {
                SPQuery query = new SPQuery();
                query.Query = "<Where><And> <IsNull><FieldRef Name=\"parent_function_Code\"/></IsNull><Eq><FieldRef Name=\"ENABLED_FLAG\"/><Value Type=\"Boolean\">1</Value></Eq></And></Where>"
              + "<OrderBy><FieldRef Name =\"index\" Ascending = \"False\" /></OrderBy> ";

                var items = menuList.GetItems(query);

                foreach (SPListItem item in items)
                {
                    MenuModel mm = new MenuModel();
                    mm.Title = (item["function_name"] ?? "").ToString();
                    mm.Code = (item["function_code"] ?? "").ToString();
                    mm.Icon = (item["icon"] ?? "glyphicon glyphicon-tasks").ToString();
                    mm.Index = Convert.ToInt32((item["index"] ?? 0));
                    mm.ParentCode = (item["parent_function_Code"] ?? "").ToString();
                    mm.Url = (item["url"] ?? "").ToString();
                    mm.OverTime = "2";
                    mm.Danger = "4";
                    dataSourse.Add(mm);
                }

                RepeaterFirstLevel.DataSource = dataSourse;
                RepeaterFirstLevel.DataBind();
            }
            else
            {
                Response.Write("没有找到sys_function表。");
            }
        }
        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                MenuModel drv = e.Item.DataItem as MenuModel;
                var _ParentCode = drv.Code;


                List<MenuModel> dataSource = new List<MenuModel>();
                SPWeb web = SPContext.Current.Site.RootWeb;
                SPList menuList = web.Lists.TryGetList("sys_function");
                if (menuList != null)
                {
                    SPQuery query = new SPQuery();
                    query.Query = "<Where><And> <Eq><FieldRef Name=\"parent_function_Code\"/><Value Type=\"Text\">" + _ParentCode + "</Value></Eq><Eq><FieldRef Name=\"ENABLED_FLAG\"/><Value Type=\"Boolean\">1</Value></Eq></And></Where>"
                  + "<OrderBy><FieldRef Name =\"index\" Ascending = \"False\" /></OrderBy> ";

                    var items = menuList.GetItems(query);

                    foreach (SPListItem item in items)
                    {
                        MenuModel mm = new MenuModel();
                        mm.Title = (item["function_name"] ?? "").ToString();
                        mm.Code = (item["function_code"] ?? "").ToString();
                        mm.Icon = (item["icon"] ?? "glyphicon glyphicon-tasks").ToString();
                        mm.Index = Convert.ToInt32((item["index"] ?? 0));
                        mm.ParentCode = (item["parent_function_Code"] ?? "").ToString();
                        mm.Url = (item["url"] ?? "").ToString(); mm.OverTime = "2";
                        mm.Danger = "4";
                        dataSource.Add(mm);
                    }

                    Repeater sub = e.Item.FindControl("SubRepeater") as Repeater;
                    sub.DataSource = dataSource;
                    sub.DataBind();
                }



            }
        }
    }
    public class MenuModel
    {
        public string Title { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public string Code { get; set; }
        public int Index { get; set; }
        public string ParentCode { get; set; }
        public string OverTime { get; set; }
        public string Danger { get; set; }
    }
}
