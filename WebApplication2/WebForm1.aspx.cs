using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            string cs = "data source= DESKTOP-25RH1OL\\SQLEXPRESS; database = TestDB; Integrated security= true";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetData", con);
            con.Open();
            empgrid.DataSource = cmd.ExecuteReader();
            empgrid.DataBind();
            con.Close();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string cs = "data source= DESKTOP-25RH1OL\\SQLEXPRESS; database = TestDB; Integrated security= true";
            SqlConnection con = new SqlConnection(cs);
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            int age = Convert.ToInt32(txtage.Text);
            int salary = Convert.ToInt32(txtsalary.Text);

            SqlCommand cmd = new SqlCommand("spInsert", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@salary",salary);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = "Record Inserted!....";

            txtfname.Text = "";
            txtlname.Text = "";
            txtage.Text = "";
            txtsalary.Text = "";
        }

        protected void empgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(empgrid.DataKeys[e.RowIndex].Value);
            string cs = "data source= DESKTOP-25RH1OL\\SQLEXPRESS; database = TestDB; Integrated security= true";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spDelete", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Empid", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            GetData();
        }

        protected void empgrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            empgrid.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void empgrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            empgrid.EditIndex = -1;
            GetData();
        }

        protected void empgrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cs = "data source= DESKTOP-25RH1OL\\SQLEXPRESS; database = TestDB; Integrated security= true";
            SqlConnection con = new SqlConnection(cs);
            int id = Convert.ToInt32(empgrid.DataKeys[e.RowIndex].Value);
            string fname = (empgrid.Rows[e.RowIndex].FindControl("txtfname")as TextBox).Text;
            string lname = (empgrid.Rows[e.RowIndex].FindControl("txtlname") as TextBox).Text;
            int age = Convert.ToInt32((empgrid.Rows[e.RowIndex].FindControl("txtage") as TextBox).Text);
            int salary = Convert.ToInt32((empgrid.Rows[e.RowIndex].FindControl("txtage") as TextBox).Text);

            SqlCommand cmd = new SqlCommand("spUpdate", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", fname);
            cmd.Parameters.AddWithValue("@LastName", lname);
            cmd.Parameters.AddWithValue("@Age", age);
            cmd.Parameters.AddWithValue("@Salary", salary);
            cmd.Parameters.AddWithValue("@Empid", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            empgrid.EditIndex = -1;
            GetData();

        }
    }
}