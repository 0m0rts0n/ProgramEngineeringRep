using System;
using System.Net;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;

namespace HospitalASP
{
    public partial class DrugsForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack) PopulateGridView();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            PopulateGridView();
        }
        private void PopulateGridView()
        {
            string apiUrl = "http://localhost:58218/api/";
            object input = new
            {
                Name = drugTxt.Text.Trim(),
            };
            string inputJson = (new JavaScriptSerializer()).Serialize(input);
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = Encoding.UTF8;
            Controllers.DrugsController drugsCtrl = new Controllers.DrugsController();
            var drugsAR = drugsCtrl.Details(new Guid(drugTxt.Text));
            var drugsVR = (ViewResult)drugsAR;
            DrugsGV.DataSource = drugsVR.ViewData.Model;
            //string json = client.UploadString(apiUrl + @"/Drugs/Details/", drugTxt.Text.Trim());

            //DrugsGV.DataSource = (new JavaScriptSerializer()).Deserialize<Drug>(json);
            DrugsGV.DataBind();
        }
    }
}