using Microsoft.SharePoint;
using Microsoft.SharePoint.Navigation;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Linq;
using System.Collections.Generic;

namespace Car.Functions.ControlTemplates.Functions
{
    public partial class CustomNavBarControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SPWeb web = SPContext.Current.Web;

            List<Nav> nav = new List<Nav>();
            foreach (SPNavigationNode item in web.Navigation.QuickLaunch)
            {
                if (item.Properties["NodeType"] != null && item.Properties["NodeType"].ToString() == "Page")
                {
                    continue;
                }
                if (item.IsVisible && item.IsExternal == false)
                {
                    nav.Add(new Nav() { Id = item.Id, Title = item.Title, Url = item.Url, HasChildren = item.Children.Count > 0, IsShow=item.Properties["Description"] });
                }
            }

            RepeaterFirstLevel.DataSource = nav;
            RepeaterFirstLevel.DataBind();

        }
        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                List<Nav> nav = new List<Nav>();
                Nav drv = e.Item.DataItem as Nav;
                SPWeb web = SPContext.Current.Web;
                SPNavigationNode node = web.Navigation.GetNodeById(drv.Id);

                foreach (SPNavigationNode item in node.Children)
                {
                    if (item.Properties["NodeType"] != null && item.Properties["NodeType"].ToString() == "Page")
                    {
                        continue;
                    }
                    if (item.IsVisible && item.IsExternal == false)
                    {
                        nav.Add(new Nav() { Id = item.Id, Title = item.Title, Url = item.Url, IsShow=item.Properties["Description"] });
                    }
                }

                //绑定子集
                Repeater sub = e.Item.FindControl("SubRepeater") as Repeater;
                sub.DataSource = nav;
                sub.DataBind();

            }
        }


    }


    public class Nav
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Url { get; set; }
        public int OverTime { get; set; }
        public int Danger { get; set; }
        public bool HasChildren { get; set; }
        public object IsShow { get; set; }
    }
}
