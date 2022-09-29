using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiscussionPanel
{
    public partial class Thread : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx", true);
            }
        }

        protected void ReplyBtn_Click(object sender, EventArgs e)
        {
            string content = ReplyContent.Text;

            string connString = ConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
            string queryString = "" +
                "INSERT INTO Reply (doubt, content, replier) VALUES (@doubt,@content, @replier)";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(queryString, conn);
                cmd.Parameters.AddWithValue("@doubt", Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@content", content);
                cmd.Parameters.AddWithValue("@replier", Session["user"]);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ReplyContent.Text = "";
                    Response.Redirect($"Thread.aspx?id={Request.QueryString["id"]}");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}