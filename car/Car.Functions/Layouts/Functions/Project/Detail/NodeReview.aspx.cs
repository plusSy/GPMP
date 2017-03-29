using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.Taxonomy;
using System.Collections.Generic;
using Car.Common;
using System.Net;

namespace Car.Functions.Layouts.Functions.Project.Detail
{
    public partial class NodeReview : LayoutsPageBase
    {
        public int pid
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["pid"]);
            }
        }

        public string gate
        {
            get
            {
                return Request.QueryString["gate"];
            }
        }

        public Guid uncompleteList
        {
            get
            {
                return SPContext.Current.Web.Lists.TryGetList("proj_review_uncomplete").ID;
            }
        }
        public Guid supportList
        {
            get
            {
                return SPContext.Current.Web.Lists.TryGetList("proj_review_support").ID;
            }
        }
        public string GetTitle(string t)
        {
            return Car.Common.SPWebHelper.GetTitle(t);
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
            SPList projectlist = web.Lists.TryGetList("proj_project");

            SPList reviewlist = web.Lists.TryGetList("proj_review");

            SPQuery query = new SPQuery();
            query.Query = string.Format("<Where><And><Eq><FieldRef Name=\"Project_Number\" LookupId=\"TRUE\"/><Value Type=\"Text\">{0}</Value></Eq> <Eq><FieldRef Name=\"Project_Gate\"  /><Value Type=\"Text\" >{1}</Value></Eq></And></Where>", pid, gate);
            SPListItemCollection gateReview = reviewlist.GetItems(query);
            if (gateReview.Count > 0)
            {
                HDReviewID.Value = gateReview[0].ID.ToString();
                LoadReview(gateReview[0]);
                //读取这个
            }
            else
            {
                var ProjectItem = projectlist.GetItemById(pid);
                web.AllowUnsafeUpdates = true;
                //创建一个
                SPListItem items = reviewlist.AddItem();
                items["Title"] = gate + "节点评审";
                items["Applicant"] = SPContext.Current.Web.CurrentUser;
                items["ApplicantDate"] = DateTime.Now;
                items["ReviewScore"] = 0;
                items["ReviewLevel"] = "";
                items["Status"] = "进行中";
                items["Step"] = "责任人发起";
                items["Project_Number"] = new SPFieldLookupValue(ProjectItem.ID, Common.SPListItemHelper.GetStringValue(ProjectItem, "Project_Number"));
                items["Project_Gate"] = Common.SPListItemHelper.GetTaxonomyValue(ProjectItem, "Project_Gate");
                items["InstanceID"] = "";
                items.Update();
                reviewlist.Update();
                web.AllowUnsafeUpdates = false;
                LoadReview(items);

                HDReviewID.Value = items.ID.ToString();
            }

        }

        private void LoadReview(SPListItem sPListItem)
        {
            txtTitle.Text = sPListItem["Title"].ToString();
            txtApplicant.Text = Common.SPListItemHelper.GetUserValue(sPListItem, "Applicant").Name;
            txtApplicantDate.Text = Common.SPListItemHelper.GetDateValue(sPListItem, "ApplicantDate").Value.ToString("yyyy-MM-dd");
        }

        //提交事件
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //申请人 新建 编辑 浏览
            //流程处理人 编辑 浏览
            //其他人 浏览
             
            FlowService.Flow flow = new FlowService.Flow();
            NetworkCredential nc = new NetworkCredential("admsp", "minth@sp123", "minth-global");
            flow.Credentials = nc;
            string str=flow.HelloWorld();
            Page.Response.Write(str);
            Page.ClientScript.RegisterClientScriptBlock(GetType(),"key", "<script>window.frameElement.cancelPopUp();</script>");
        }
    }


}
