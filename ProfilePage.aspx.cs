using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace DiscussionPanel
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx", true);
            }
            else
            {
                if(!Page.IsPostBack)
                    updateUserDetails();
            }
        }

        protected void updateUserDetails() {
                string email = (string)Session["user"];
                string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
                string query = "SELECT * FROM USERS WHERE email=@email";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@email", email);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        ProfileEmail.Text = reader.GetString(1);
                        ProfileName.Text = reader.GetString(2);
                        ProfilePassword.Text = reader.GetString(3);

                        if (reader.GetString(4).Contains("Male"))
                            ProfileGender.Items[0].Selected = true;
                        else if (reader.GetString(4).Contains("Female"))
                            ProfileGender.Items[1].Selected = true;
                    }
                    conn.Close();

                }
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("LoginPage.aspx", true);
        }

        protected void updateProfileBtn_Click(object sender, EventArgs e)
        {

            string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
            string queryString = "" +
                "UPDATE USERS SET [password]=@pass, [name]=@name, [gender]=@gender WHERE [email]=@email";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(queryString, conn);
                cmd.Parameters.AddWithValue("@email", ProfileEmail.Text);
                cmd.Parameters.AddWithValue("@name", ProfileName.Text);
                cmd.Parameters.AddWithValue("@pass", ProfilePassword.Text);
                cmd.Parameters.AddWithValue("@gender", ProfileGender.SelectedValue);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
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