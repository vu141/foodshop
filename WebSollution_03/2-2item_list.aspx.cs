using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _2_2item_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource_item_order_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }



        protected void Button_戻る_Click(object sender, EventArgs e)
        {
            Response.Redirect("2-1main.aspx");
        }

        protected void Button_new_Click(object sender, EventArgs e)
        {
            Session["item_id"] = "999999";
            Response.Redirect("2-3item_maintenance.aspx");

        }

        protected void GridView_item_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                int args = Convert.ToInt32(e.CommandArgument);
                Session["item_id"] = args;
                Response.Redirect("2-3item_maintenance.aspx");

            }
        }
    }
}