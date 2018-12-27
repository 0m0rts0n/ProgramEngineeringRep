using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalASP
{
    public partial class MainForm : System.Web.UI.Page
    {
        string address = "http://localhost:58218";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AccountingWorksBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/AccountingWorks");
        }

        protected void AccShiftDutiesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/AccShiftDuties");
        }

        protected void AgenciesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Agencies");
        }

        protected void AnalyzesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Analyzes");
        }

        protected void DoctorDischargesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/DoctorDischarges");
        }

        protected void DoctorsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Doctors");
        }

        protected void HistoryillingsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Historyillings");
        }

        protected void IllingsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Illings");
        }

        protected void PatientCardsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/PatientCards");
        }

        protected void PatientsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Patients");
        }

        protected void PoliciesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Policies");
        }

        protected void ReceptionsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Receptions");
        }

        protected void ShiftsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Shifts");
        }

        protected void SpecificationsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Specifications");
        }

        protected void VisitsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(address + "/Visits");
        }
    }
}