using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class eshop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Get_Summary();

        }

       

        protected void LinkButton_お買い物_Click(object sender, EventArgs e)
        {
            Response.Redirect("1-3choice.aspx");

        }

        public void Get_Summary()
        {
            //ラベルの初期化
            Label_商品点数.Text = "0";
            Label_会計金額.Text = "0";

            if (Session["order_no"] != null )
            {

                DataSourceSelectArguments args = new DataSourceSelectArguments();


                DataView dataView = (DataView)SqlDataSource_order_summary.Select(args);

                if(dataView.Table.Rows.Count > 0)
                {
                    Label_商品点数.Text = String.Format("{0:d}",dataView.Table.Rows[0].ItemArray.GetValue(1));
                    Label_会計金額.Text = String.Format("{0:c}", dataView.Table.Rows[0].ItemArray.GetValue(2)); 



                }

            }
            
                
            
        }

        protected void Button_お会計_Click(object sender, EventArgs e)
        {
            Response.Redirect("1-5cashier.aspx");
        }
    }
}