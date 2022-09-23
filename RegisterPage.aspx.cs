using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace DiscussionPanel
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string email = RegisterEmail.Text;
            string pass = RegisterPassword.Text;
            string cpass = RegisterCPassword.Text;
            string gender = RegisterGender.SelectedValue;
            string name = RegisterName.Text;

            if (pass != cpass) {
                Response.Write("Passwords don't match");
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
            string queryString = "" +
                "INSERT INTO USERS (email, name, password, gender) VALUES (@email, @name, @pass, @gender)";

            using (SqlConnection conn = new SqlConnection(connString)) {
                SqlCommand cmd = new SqlCommand(queryString, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@gender", gender);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["user"] = email;
                    Response.Redirect("ProfilePage.aspx", true);
                }
                catch(Exception ex) {
                    Response.Write("The account already exists.");
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}