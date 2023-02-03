using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _1_7finish : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //顧客情報取得
            Label_customer_id.Text = Session["customer_id"].ToString();
            Label_customer_name.Text = Session["customer_name"].ToString();

            //セッションオブジェクトのクリア
            Session.RemoveAll();

        }
    }
}