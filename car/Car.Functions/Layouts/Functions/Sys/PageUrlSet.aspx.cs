using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace Car.Functions.Layouts.Functions.Sys
{
    public partial class PageUrlSet : LayoutsPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnEmailSetting_Click(object sender, EventArgs e)
        {
            SPContext.Current.Web.AllowUnsafeUpdates = true;
            SPList list = SPContext.Current.List;
            SPContentType te = list.ContentTypes["项目"]; 
            te.EditFormUrl = SPContext.Current.Web.ServerRelativeUrl + "/_layouts/15/functions/project/detail/gateediter.aspx"; 
            te.Update();
            list.Update();
            SPContext.Current.Web.AllowUnsafeUpdates = false;
        }

        protected void btnDefaultSetting_Click(object sender, EventArgs e)
        {
            SPContext.Current.Web.AllowUnsafeUpdates = true;
            SPList list = SPContext.Current.List;
            SPContentType te = list.ContentTypes["项目"];
          
            te.EditFormUrl = "";
        
            te.Update();
            list.Update();
            SPContext.Current.Web.AllowUnsafeUpdates = false;
        }
    }
}
