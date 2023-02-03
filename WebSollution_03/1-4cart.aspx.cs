using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _1_4cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                string order_no = Session["order_no"].ToString();
                int rows = Convert.ToInt32(e.CommandArgument);
                string item_id = GridView1.Rows[rows].Cells[0].Text;

                if (e.CommandName.Equals("_upd"))
                {
                    TextBox tx = (TextBox)GridView1.Rows[rows].FindControl("Textbox_quanlity");
                    string quanlity = tx.Text;
                    SqlDataSource_order_detail.UpdateParameters["order_no"].DefaultValue = order_no;
                    SqlDataSource_order_detail.UpdateParameters["item_id"].DefaultValue = item_id;
                    SqlDataSource_order_detail.UpdateParameters["quanlity"].DefaultValue = quanlity;
                    SqlDataSource_order_detail.Update();
                }
                else if (e.CommandName.Equals("_del"))
                {
                    SqlDataSource_order_detail.DeleteParameters["order_no"].DefaultValue = order_no;
                    SqlDataSource_order_detail.DeleteParameters["item_id"].DefaultValue = item_id;
                    SqlDataSource_order_detail.Delete();
                }
            }
            catch
            {
                Label_msg.Text = "エラー発生があります。";
            }
            finally
            {
                GridView1.DataBind();
            }
            Master.Get_Summary();


        }
        
    }
}