using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _2_5customer_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_戻る_Click(object sender, EventArgs e)
        {
            Response.Redirect("2-4customer_list.aspx");
        }
    }
}