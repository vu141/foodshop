using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _2_4customer_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_戻る_Click(object sender, EventArgs e)
        {
            Response.Redirect("2-1main.aspx");

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                int args = Convert.ToInt32(e.CommandArgument);
                Session["customer_id"] = args;
                Response.Redirect("2-5customer_info.aspx");

            }
        }
    }
}