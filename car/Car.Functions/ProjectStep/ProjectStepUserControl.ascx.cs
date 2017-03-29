using Car.Functions.Layouts.Functions.Project.Detail;
using Microsoft.SharePoint;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Car.Functions.ProjectStep
{
    public partial class ProjectStepUserControl : UserControl
    {
        /// <summary>
        /// 项目编号
        /// </summary>
        public int pid
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["ID"]);
            }
        }


        public string QStatus { get; set; }
        public string CStatus { get; set; }
        public string DStatus { get; set; }
        public string PStatus { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {


            //获取项目

            GetProject();
            //状态灯
            StatusLight();
        }

        private void StatusLight()
        {
            SPWeb web = SPContext.Current.Web;
            SPList list = web.Lists.TryGetList("proj_objectives");
            if (list != null)
            {
                SPQuery query = new SPQuery();
                query.Query = string.Format("<Where><Eq><FieldRef Name=\"{0}\" LookupId=\"TRUE\"/><Value Type=\"Text\">{1}</Value></Eq></Where>", list.Fields.GetFieldByInternalName("Project_Number").InternalName, SPContext.Current.ItemId);


                SPListItemCollection items = list.GetItems(query);
                List<Car.Models.ProjectTarget> t = new List<Car.Models.ProjectTarget>();
                if (items.Count > 0)
                {
                    foreach (SPListItem item in items)
                    {
                        Car.Models.ProjectTarget pt = new Car.Models.ProjectTarget();
                        Car.Common.SPListItemHelper.ItemToModel(item, pt);
                        t.Add(pt);
                    }

                }
                //判断灯；
                List<g> df = new List<g>();
                df.Add(new g() { GateTitle = "GATE1", Index = "1" });
                df.Add(new g() { GateTitle = "GATE2", Index = "2" });
                df.Add(new g() { GateTitle = "GATE3", Index = "3" });
                df.Add(new g() { GateTitle = "GATE4-1", Index = "4" });
                df.Add(new g() { GateTitle = "GATE4-2", Index = "4" });
                df.Add(new g() { GateTitle = "GATE5", Index = " 5" });
                df.Add(new g() { GateTitle = "SOP", Index = " s" });

            }
        }

        private void GetProject()
        {
            SPListItem itme = SPContext.Current.ListItem;
            try
            {
                Car.Models.ProjectInfo pt = new Car.Models.ProjectInfo();
                Car.Common.SPListItemHelper.ItemToModel(itme, pt);

                //项目名称
                ProjectTitle.Text = pt.Project_Name;

                ///状态灯
                QStatus = pt.Project_Quality_Status;
                CStatus = pt.Project_Cost_Status;
                DStatus = pt.Project_Delivery_Status;
                PStatus = pt.Project_Risk_Status;


                //客户端代码保留项目信息
        var t=        JsonConvert.SerializeObject(pt);
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "ProjectInfo", "var _ProjectInfo=" +t+ ";", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

    public class g
    {
        public string GateTitle { get; set; }
        public string Index { get; set; }
    }
}
