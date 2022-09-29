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
    public partial class DoubtPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx", true);
            }
        }

        protected void PostDoubtBtn_Click(object sender, EventArgs e)
        {
            string heading = DoubtHeading.Text;
            string content = DoubtContent.Text;
            string category = SelectCategory.Text;

            string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
            string queryString = "" +
                "INSERT INTO DOUBTS (creator, heading, content, category) VALUES (@creator, @heading, @content, @category)";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(queryString, conn);
                cmd.Parameters.AddWithValue("@creator", Session["user"]);
                cmd.Parameters.AddWithValue("@heading", heading);
                cmd.Parameters.AddWithValue("@content", content);
                cmd.Parameters.AddWithValue("@category", category);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    DoubtHeading.Text = "";
                    DoubtContent.Text = "";

                    StatusText.Text = "✅ Discussion Thread Started!";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}