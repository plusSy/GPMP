using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Car.Functions.ProjectTabs
{
    public partial class ProjectTabsUserControl : UserControl
    {
        public string GetTitle(string t)
        {
            return Car.Common.SPWebHelper.GetTitle(t);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Car.WebService.CodeLogic.K2 d = new WebService.CodeLogic.K2();
        }
    }
}
