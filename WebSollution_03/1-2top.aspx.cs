using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebSollution_03
{
    public partial class _1_2top2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                Button_ログイン.Enabled = true;
                Button_ログオフ.Enabled = false;
                Label_msg.Text = "";


            }

            if(Session["customer_id"] != null)
            {
                Label_msg.Text = "ようこそ" + Session["customer_name"].ToString() + "さん";
                TextBox_customer_id.Enabled = false;
                Button_ログイン.Enabled = false;
                Button_ログオフ.Enabled = true;  


            }
           
            

        }

        protected void Button_ログイン_Click(object sender, EventArgs e)
        {
            if (TextBox_customer_id.Text == "")
            {
                Label_msg.Text = "顧客IDを入力してください。";
            }else
            
            {
                SqlDataSource_customer.SelectParameters["customer_id"].DefaultValue = TextBox_customer_id.Text;
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView dataView = (DataView)SqlDataSource_customer.Select(args);

                if (dataView.Table.Rows.Count > 0)
                {
                    Label_msg.Text = "ようこそ" + dataView.Table.Rows[0].ItemArray.GetValue(1) + "さん";
                    Button_ログイン.Enabled = false;
                    Button_ログオフ.Enabled = true;

                    Session["customer_id"] = dataView.Table.Rows[0].ItemArray.GetValue(0);
                    Session["customer_name"] = dataView.Table.Rows[0].ItemArray.GetValue(1);
                    Session["customer_kana"] = dataView.Table.Rows[0].ItemArray.GetValue(2);
                    Session["customer_tel"] = dataView.Table.Rows[0].ItemArray.GetValue(3);
                    Session["customer_zipcode"] = dataView.Table.Rows[0].ItemArray.GetValue(4);
                    Session["customer_address"] = dataView.Table.Rows[0].ItemArray.GetValue(5);



                }
                else
                {
                    Label_msg.Text = "顧客IDが存在していません";

                }
            }



        }

        protected void Button_ログオフ_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();

            TextBox_customer_id.Text = "";
            Label_msg.Text = "";
            TextBox_customer_id.Enabled = true;
            Button_ログイン.Enabled = true;
            Button_ログオフ.Enabled = false;


        }
    }
}