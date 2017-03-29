using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.Script.Serialization;
using System.Threading;
using Car.Common;

namespace Car.Functions.Layouts.Functions.Project.Detail
{
     

    public partial class ProjectObjective : LayoutsPageBase
    {
        public string GetTitle(string t)
        {
            return Car.Common.SPWebHelper.GetTitle(t);
        }
        public string GetFieldTitle(string field)
        {
            SPList list = SPContext.Current.Web.Lists.TryGetList("proj_objectives");
            if (list != null)
            {
                return SPListHelper.GetFieldTitle(list, field);
            }
            else
            {
                return field;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //List<fields> fieldlist = new List<fields>();

            //SPList list = SPContext.Current.Web.Lists.TryGetList("proj_objectives");
            //if (list != null)
            //{
            //    fieldlist.Add(new fields { field = "Project", title = SPListHelper.GetFieldTitle(list, "Project"), width = "15%", align = "middle" });//指标
            //    fieldlist.Add(new fields { field = "Description", title = SPListHelper.GetFieldTitle(list, "Description"), width = "50%", align = "middle" });//说明
            //    fieldlist.Add(new fields { field = "InCharge", title = SPListHelper.GetFieldTitle(list, "InCharge"), width = "15%", align = "middle" });//责任人
            //    fieldlist.Add(new fields { field = "Target", title = SPListHelper.GetFieldTitle(list, "Target"), width = "5%", align = "middle" });//目标
            //    fieldlist.Add(new fields { field = "Actual", title = SPListHelper.GetFieldTitle(list, "Actual"), width = "5%", align = "middle" });//实际
            //    fieldlist.Add(new fields { field = "Status", title = SPListHelper.GetFieldTitle(list, "Status"), width = "10%", align = "right" });//状态

            //    JavaScriptSerializer s = new JavaScriptSerializer();
            //    var colStr = s.Serialize(fieldlist);

            //    ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "columns", "var _columns=" + colStr + ";", true);
            //}
            //else
            //{
            //    Response.Write("没有找到proj_objective列表。");
            //}

        }
    }


    //public class fields
    //{
    //    public string field { get; set; }
    //    public string title { get; set; }
    //    public string width { get; set; }
    //    public string align { get; set; }

    //}


}
