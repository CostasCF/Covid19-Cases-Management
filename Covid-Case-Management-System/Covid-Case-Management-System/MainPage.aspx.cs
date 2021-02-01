﻿using System;
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

        CovidCase newCovidCase;
        DataHandler mydatahandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydatahandler = new DataHandler();
            if (!IsPostBack) {
                mydatahandler.bindData(GridView1);
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            mydatahandler = new DataHandler();
            mydatahandler.bindData(GridView1);
        }
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.rowUpdateData(GridView1,e);
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            mydatahandler = new DataHandler();
            mydatahandler.bindData(GridView1);
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.rowDeleteData(GridView1,e);
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            mydatahandler = new DataHandler();
            mydatahandler.bindData(GridView1);
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
            newCovidCase = new CovidCase(FirstName, LastName, PhoneNumber, Gender, Age, Address, Deseases, Date);
            mydatahandler = new DataHandler();
            mydatahandler.insertData(newCovidCase);
            mydatahandler.bindData(GridView1);


        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            mydatahandler = new DataHandler();
            mydatahandler.searchData(GridView1, txtSearch);
        }
    }

    public class DataHandler
    {
        public SqlConnection connectToDatabase()
        {
            string connectionstring = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Covid19-CaseDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            SqlConnection mysqlconnection = new SqlConnection(connectionstring);
            return mysqlconnection;
        }

        public DataTable executeSqlCommand(string command, SqlConnection mysqlconnection) //example: SELECT command to a database
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = command;
            cmd.Connection = mysqlconnection;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;

        }

        public void insertData(CovidCase newCovidCase)
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

        public void bindData(GridView aGridView)
        {
            SqlConnection mysqlconnection = connectToDatabase();
            mysqlconnection.Open();
            DataTable dt = new DataTable();
            dt = executeSqlCommand("SELECT * FROM newCovidCases", mysqlconnection);
            aGridView.DataSource = dt;
            aGridView.DataBind();
            mysqlconnection.Close();
        }

        public void searchData(GridView aGridView,TextBox searchkey)
        {
            SqlConnection mysqlconnection = connectToDatabase();
            SqlCommand cmd = new SqlCommand();
            mysqlconnection.Open();
            string sql = "SELECT Id, FirstName, LastName, PhoneNumber, Gender, Age, Address, Deseases, Date FROM newCovidCases";
            if (!string.IsNullOrEmpty(searchkey.Text.Trim()))
            {
                sql += " WHERE FirstName LIKE @FirstName + '%'";
                cmd.Parameters.AddWithValue("@FirstName", searchkey.Text.Trim());
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

        public void rowUpdateData(GridView aGridView, GridViewUpdateEventArgs e)
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
            using (SqlConnection mysqlconnection = connectToDatabase())
            {
                mysqlconnection.Open();
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@FirstName", FirstName);
                    cmd.Parameters.AddWithValue("@LastName", LastName);
                    cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Age", Age);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@Deseases", Deseases);
                    cmd.Parameters.AddWithValue("@Date", Date);
                    cmd.Connection = mysqlconnection;
                    cmd.ExecuteNonQuery();
                    mysqlconnection.Close();
                }
            }
            aGridView.EditIndex = -1;
            bindData(aGridView);

        }

        public void rowDeleteData(GridView aGridView, GridViewDeleteEventArgs e) 
        {
            int Id = Convert.ToInt32(aGridView.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM newCovidCases WHERE Id=@Id";
            using (SqlConnection mysqlconnection = connectToDatabase())
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
            bindData(aGridView);
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