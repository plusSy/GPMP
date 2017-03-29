using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace Car.Functions.Layouts.Functions.Project
{
    public partial class ToBeMaintained : LayoutsPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TestService.WebService1 ts = new TestService.WebService1();
         var v=   ts.HelloWorld();
        }
    }
}
