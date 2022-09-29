using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DiscussionPanel
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = LoginEmail.Text;
            string pass = LoginPassword.Text;

            string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

            string query = "SELECT * FROM USERS WHERE email=@email AND password=@pass";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pass", pass);
                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows) {
                        // Response.Write("User logged in successfully!");
                        Session["user"] = email;
                        Response.Redirect("Home.aspx", true);
                    } else {
                        Response.Write("Email or Password supplied are incorrect!");
                    } 
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }

        }
    }
}