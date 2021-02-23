using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace Covid_Case_Management_System
{
    public partial class MainPage : System.Web.UI.Page
    {

        CovidCase newCovidCase;
        DataHandler mydatahandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydatahandler = new DataHandler();
            if (!IsPostBack)
            {  
                mydatahandler.BindData(GridView1);
              }
        }

        #region controlsEvents
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            mydatahandler = new DataHandler();
            mydatahandler.BindData(GridView1);
        }
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.RowUpdateData(GridView1,e);
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            mydatahandler = new DataHandler();
            mydatahandler.BindData(GridView1);
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.RowDeleteData(GridView1,e);
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            mydatahandler = new DataHandler();
            mydatahandler.BindData(GridView1);
        }
        
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            string FirstName = firstNameBox.Text.ToString();
            string LastName = lastNameBox.Text.ToString();
            string PhoneNumber = phoneNumberBox.Text.ToString();
            string Gender;
            if (maleRdoBtn.Checked)
            {
                Gender = maleRdoBtn.Text.ToString();
            }
            else
            {
                Gender = femaleRdoBtn.Text.ToString();
            }
            string Age = ageBox.Text.ToString();
            string Address = addressBox.Text.ToString();
            string Deseases = deseasesBox.Text.ToString();
            string Date = dateBox.Text.ToString();
            newCovidCase = new CovidCase(FirstName, LastName, PhoneNumber, Gender, Age, Address, Deseases, Date);
            mydatahandler = new DataHandler();
            mydatahandler.InsertData(newCovidCase); //inserts data
            mydatahandler.BindData(GridView1); 


        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.SearchData(GridView1, txtSearch);
        }
        #endregion
    }

    public class DataHandler
    { 
        //connects to the database via the given connection string
        public SqlConnection ConnectToDatabase()
        {
            string connectionstring = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Covid19-CaseDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            SqlConnection mysqlconnection = new SqlConnection(connectionstring);
            return mysqlconnection;
        }        

        //executes an SQL command like a SELECT command
        public DataTable ExecuteSqlCommand(string command, SqlConnection mysqlconnection) //example: SELECT command to a database
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = command;
            cmd.Connection = mysqlconnection;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;

        }

        //inserts the data into the database using C# Model Container
        public void InsertData(CovidCase newCovidCase)
        {
            Model1Container query = new Model1Container();
            newCovidCase ncc = new newCovidCase(); //ncc is an object reference to the table of the database
            ncc.FirstName = newCovidCase.FirstName;
            ncc.LastName = newCovidCase.LastName;
            ncc.PhoneNumber = newCovidCase.PhoneNumber;
            ncc.Gender = newCovidCase.Gender;
            ncc.Age = Int32.Parse((newCovidCase.Age));
            ncc.Address = newCovidCase.Address;
            ncc.Deseases = newCovidCase.Deseases;
            ncc.Date = newCovidCase.Date;   
            query.newCovidCases.Add(ncc);
            query.SaveChanges();
        }

        //reloads/refreshes the data in the gridview
        public void BindData(GridView aGridView)
        {
            SqlConnection mysqlconnection = ConnectToDatabase();
            mysqlconnection.Open();
            DataTable dt = new DataTable();
            dt = ExecuteSqlCommand("SELECT * FROM newCovidCases", mysqlconnection);
            aGridView.DataSource = dt;
            aGridView.DataBind();
            mysqlconnection.Close();
        }
        
        //searchs data into the database based on the LastName field
        public void SearchData(GridView aGridView,TextBox searchkey)
        {
            SqlConnection mysqlconnection = ConnectToDatabase();
            SqlCommand cmd = new SqlCommand();
            mysqlconnection.Open();
            string sql = "SELECT Id, FirstName, LastName, PhoneNumber, Gender, Age, Address, Deseases, Date FROM newCovidCases";
            if (!string.IsNullOrEmpty(searchkey.Text.Trim()))
            {
                sql += " WHERE LastName LIKE @LastName + '%'";
                cmd.Parameters.AddWithValue("@LastName", searchkey.Text.Trim());
            }
            cmd.CommandText = sql;
            cmd.Connection = mysqlconnection;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            aGridView.DataSource = dt;
            aGridView.DataBind();
            mysqlconnection.Close();
        }

        //updates the data to the database via the row edited by the user 
        public void RowUpdateData(GridView aGridView, GridViewUpdateEventArgs e)
        {
            GridViewRow row = aGridView.Rows[e.RowIndex];
            int Id = Convert.ToInt32(aGridView.DataKeys[e.RowIndex].Values[0]);
            string FirstName = (row.FindControl("txtFirstName") as TextBox).Text.Trim();
            string LastName = (row.FindControl("txtLastName") as TextBox).Text;
            string PhoneNumber = (row.FindControl("txtPhoneNumber") as TextBox).Text;
            string Gender = (row.FindControl("txtGender") as TextBox).Text;
            string Age = (row.FindControl("txtAge") as TextBox).Text;
            string Address = (row.FindControl("txtAddress") as TextBox).Text;
            string Deseases = (row.FindControl("txtDeseases") as TextBox).Text;
            string Date = (row.FindControl("txtDate") as TextBox).Text;
            string query = "UPDATE newCovidCases SET FirstName=@FirstName, LastName=@LastName, PhoneNumber=@PhoneNumber, Gender=@Gender, Age=@Age, Address=@Address, Deseases=@Deseases, Date=@Date WHERE Id=@Id";
            using (SqlConnection mysqlconnection = ConnectToDatabase())
            {
                mysqlconnection.Open();
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@FirstName", FirstName);
                    cmd.Parameters.AddWithValue("@LastName", LastName);
                    cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Age", Int32.Parse(Age));          
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@Deseases", Deseases);
                    cmd.Parameters.AddWithValue("@Date", Date);
                    cmd.Connection = mysqlconnection;
                    cmd.ExecuteNonQuery();
                    mysqlconnection.Close();
                }
            }
            aGridView.EditIndex = -1;
            BindData(aGridView);

        }    
       
        //deletes the row of data inside the database via the row selected by the user 
        public void RowDeleteData(GridView aGridView, GridViewDeleteEventArgs e) 
        {
            int Id = Convert.ToInt32(aGridView.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM newCovidCases WHERE Id=@Id";
            using (SqlConnection mysqlconnection = ConnectToDatabase())
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Connection = mysqlconnection;
                    mysqlconnection.Open();
                    cmd.ExecuteNonQuery();
                    mysqlconnection.Close();
                }
            }
            BindData(aGridView);
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
    }
}