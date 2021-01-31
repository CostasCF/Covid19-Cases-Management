using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Covid_Case_Management_System
{
    public partial class MainPage : System.Web.UI.Page
    {
       // SqlConnection constr;
       // SqlCommand cmd;
        CovidCase newCovidCase;
        protected void Page_Load(object sender, EventArgs e)
        {
           // constr = new SqlConnection();
          //  cmd = new SqlCommand();
            if (!this.IsPostBack)
            {
                this.SearchCustomers();
            }
        }


        private void SearchCustomers()
        {
          //  string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Covid19-CaseDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT Id FROM newCovidCases";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE Id LIKE @Id + '%'";
                        cmd.Parameters.AddWithValue("@Id", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                     //   GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void Search(object sender, EventArgs e)
        {
            this.SearchCustomers();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.SearchCustomers();
        }
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            string FirstName = firstNameBox.Text.ToString();
            string LastName = lastNameBox.Text.ToString();
            string PhoneNumber = phoneNumberBox.Text.ToString();
            string Gender = genderBox.Text.ToString();
            string Age = ageBox.Text.ToString();
            string Address = addressBox.Text.ToString();
            string Deseases = deseasesBox.Text.ToString();
            string Date = dateBox.Text.ToString();
            DataEntry myDataEnry = new DataEntry();
            newCovidCase = new CovidCase(FirstName, LastName, PhoneNumber, Gender, Age, Address, Deseases, Date);
            myDataEnry.enteringData(newCovidCase);
            GridView1.DataBind();

        }


    }
    public class DataEntry
    {
        public void enteringData(CovidCase newCovidCase)
        {
            Model1Container query = new Model1Container();
            newCovidCase ncc = new newCovidCase();
            ncc.FirstName = newCovidCase.FirstName;
            ncc.LastName = newCovidCase.LastName;
            ncc.PhoneNumber = newCovidCase.PhoneNumber;
            ncc.Gender = newCovidCase.Gender;
            ncc.Age = newCovidCase.Age;
            ncc.Address = newCovidCase.Address;
            ncc.Deseases = newCovidCase.Deseases;
            ncc.Date = newCovidCase.Date;
            query.newCovidCases.Add(ncc);
            query.SaveChanges();
        }

        public void showingData()
        {

        }
    }

    public class CovidCase
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string Gender { get; set; }
        public string Age { get; set; }
        public string Address { get; set; }
        public string Deseases { get; set; }
        public string Date { get; set; }
        public CovidCase(string firstname, string lastName, string phoneNumber, string gender, string age, string address, string deseases,string data)
        {
            FirstName = firstname;
            LastName = lastName;
            PhoneNumber = phoneNumber;
            Gender = gender;
            Age = age;
            Address = address;
            Deseases = deseases;
            Date = data;
        }

        public CovidCase()
        {

        }
    }
}