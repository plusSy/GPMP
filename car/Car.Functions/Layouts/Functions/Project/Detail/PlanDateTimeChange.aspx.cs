using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Collections.Generic;

namespace Car.Functions.Layouts.Functions.Project.Detail
{
    public partial class PlanDateTimeChange : LayoutsPageBase
    {

        public int pid
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["pid"]);
            }
        }

        public int taskid
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["taskid"]);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTaskInfo();
            }

        }

        private void LoadTaskInfo()
        {
            SPWeb web = SPContext.Current.Web;
            SPList tasklist = web.Lists.TryGetList("proj_task");
            SPList projectlist = web.Lists.TryGetList("proj_project");
            SPList projectdatechange = web.Lists.TryGetList("proj_datechange");

            //如果这个pid中的taskid有未开始的项目，读取这个项目，如果没有新建
            SPListItem taksItem = tasklist.GetItemById(taskid);
            var tax = Common.SPListItemHelper.GetTaxonomyValue(taksItem, "Project");
            var planDate = Common.SPListItemHelper.GetDateValue(taksItem, "PlanDate");


            SPQuery query = new SPQuery();
            query.Query = string.Format("<Where><And><Eq><FieldRef Name=\"Project_Number\" LookupId=\"TRUE\"/><Value Type=\"Text\">{0}</Value></Eq> <Eq><FieldRef Name=\"Task\" LookupId=\"TRUE\"  /><Value Type=\"Integer\" >{1}</Value></Eq></And></Where>", pid, tax.WssId);
            SPListItemCollection taskDataChange = projectdatechange.GetItems(query);
            if (taskDataChange.Count > 0)
            { 
                //将ID保存到页面上
                HDChangeDateID.Value = taskDataChange[0].ID.ToString();   
                System.Web.Script.Serialization.JavaScriptSerializer s = new System.Web.Script.Serialization.JavaScriptSerializer();
                KeyValue  d = new KeyValue() { key= taskDataChange[0].ID,value= taskDataChange[0].ID.ToString() };
                ClientScript.RegisterClientScriptBlock(this.GetType(), "DateChangeID", "var _DateChangeID=" + s.Serialize(d) + ";", true);


                load(taskDataChange[0]);
                //读取这个
            }
            else
            {
                web.AllowUnsafeUpdates = true;
                //创建一个
                SPListItem items = projectdatechange.AddItem();
                items["Title"] = tax.Label + "计划时间变更" + taskid.ToString();
                items["Applicant"] = SPContext.Current.Web.CurrentUser;
                items["ApplicantDate"] = DateTime.Now;
                items["Task"] = tax;
                items["OldPlanDate"] = planDate;
                items["Project_Number"] = new SPFieldLookupValue(pid, Common.SPListItemHelper.GetStringValue(projectlist.GetItemById(pid), "Project_Number"));
                items.Update();
                projectdatechange.Update();
                web.AllowUnsafeUpdates = false;
                load(items);



                //将ID保存到页面上
                HDChangeDateID.Value = items.ID.ToString();
                System.Web.Script.Serialization.JavaScriptSerializer s = new System.Web.Script.Serialization.JavaScriptSerializer();
                KeyValue d = new KeyValue() { key = taskDataChange[0].ID, value = taskDataChange[0].ID.ToString() };
                ClientScript.RegisterClientScriptBlock(this.GetType(), "DateChangeID", "var _DateChangeID="+s.Serialize(d )+ ";", true);


            }


        }

        public void load(SPListItem item)
        {
            txtTitle.Text = item["Title"].ToString();
            txtApplicant.Text = Common.SPListItemHelper.GetUserValue(item, "Applicant").Name;
            txtApplicantDate.Text = Common.SPListItemHelper.GetDateValue(item, "ApplicantDate").Value.ToString("yyyy-MM-dd");
            txtTask.Text = Common.SPListItemHelper.GetTaxonomyValue(item, "Task").Label;
            try
            {
                txtOldPlanDate.Text = Common.SPListItemHelper.GetDateValue(item, "OldPlanDate").Value.ToString("yyyy-MM-dd");
            }
            catch
            { }
            DDLChangeType.SelectedValue = item["ChangeType"].ToString();
            loadSub(item["ChangeType"].ToString());
            DDLChangeTypeSub.SelectedValue = item["ChangeSubType"].ToString();
            txtChangeNode.Text = (item["ChangeNode"] ?? "").ToString();
        }

        protected void DDLChangeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadSub(DDLChangeType.SelectedValue);
        }

        private void loadSub(string selected) {
            if (selected == "供方原因")
            {
                Dictionary<string, string> n = new Dictionary<string, string>();
                n.Add("供方进度延后", "供方进度延后");
                n.Add("供方品质问题", "供方品质问题");
                DDLChangeTypeSub.DataTextField = "Value";
                DDLChangeTypeSub.DataValueField = "Value";
                DDLChangeTypeSub.DataSource = n;
                DDLChangeTypeSub.DataBind();
            }
            else if (selected == "内部原因")
            {
                Dictionary<string, string> n = new Dictionary<string, string>();
                n.Add("内部设变/变更 ", "内部设变/变更 ");
                n.Add("内部进度延后", "内部进度延后");
                n.Add("内部工装品质问题", "内部工装品质问题");
                n.Add("设备进度延后", "设备进度延后");
                n.Add("工厂生产现场准备不足", "工厂生产现场准备不足");
                n.Add("节点评审不通过", "节点评审不通过");
                n.Add("其他", "其他");
                DDLChangeTypeSub.DataTextField = "Value";
                DDLChangeTypeSub.DataValueField = "Value";
                DDLChangeTypeSub.DataSource = n;
                DDLChangeTypeSub.DataBind();
            }
            else if (selected == "客户原因")
            {
                Dictionary<string, string> n = new Dictionary<string, string>();
                n.Add("整车进度延后 ", "整车进度延后 ");
                n.Add("客户设变", "客户设变");
                n.Add("客户行程变更", "客户行程变更");
                n.Add("客户审批延后", "客户审批延后");
                n.Add("客户数据冻结延后", "客户数据冻结延后");
                n.Add("其他", "其他");
                DDLChangeTypeSub.DataTextField = "Value";
                DDLChangeTypeSub.DataValueField = "Value";
                DDLChangeTypeSub.DataSource = n;
                DDLChangeTypeSub.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }

    public class KeyValue {
        public int key { get; set; }
        public string value { get; set; }
    }
}
