using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _1__6confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label_name.Text = Session["customer_name"].ToString();
            Label_kana.Text = Session["customer_kana"].ToString();
            Label_tel.Text = Session["customer_tel"].ToString();
            Label_zipcode.Text = Session["customer_zipcode"].ToString();
            Label_address.Text = Session["customer_address"].ToString();   
            
            if(Session["order_no"] == null)
            {
                Button_注文確定.Enabled = false;

            }
            else
            {
                SqlDataSource_view_order.SelectParameters["order_no"].DefaultValue = Session["order_no"].ToString();
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView dataView = (DataView)SqlDataSource_view_order.Select(args);

                if(dataView.Table.Rows.Count == 0)
                {
                    Button_注文確定.Enabled = true;

                }

            }

        }

        protected void Button_戻る_Click(object sender, EventArgs e)
        {
            Response.Redirect("1-5cashier.aspx");

        }

        protected void Button_注文確定_Click(object sender, EventArgs e)
        {
            int customer_id = 0;
            if (Session["customer_id"] == null)
            {
                SqlDataSource_customer.InsertParameters["customer_name"].DefaultValue = Session["customer_name"].ToString();
                SqlDataSource_customer.InsertParameters["customer_kana"].DefaultValue = Session["customer_kana"].ToString();
                SqlDataSource_customer.InsertParameters["tel"].DefaultValue = Session["customer_tel"].ToString();
                SqlDataSource_customer.InsertParameters["zipcode"].DefaultValue = Session["customer_zipcode"].ToString();
                SqlDataSource_customer.InsertParameters["address"].DefaultValue = Session["customer_address"].ToString();
                SqlDataSource_customer.Insert();

                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView dataView = (DataView)SqlDataSource_customer.Select(args);
                Session["customer_id"] = dataView.Table.Rows[0].ItemArray.GetValue(0).ToString();



            }
            else
            {
                customer_id = (int)Session["customer_id"];

                SqlDataSource_customer.UpdateParameters["customer_id"].DefaultValue = Session["customer_id"].ToString();
                SqlDataSource_customer.UpdateParameters["customer_name"].DefaultValue = Session["customer_name"].ToString();
                SqlDataSource_customer.UpdateParameters["customer_kana"].DefaultValue = Session["customer_kana"].ToString();
                SqlDataSource_customer.UpdateParameters["tel"].DefaultValue = Session["customer_tel"].ToString();
                SqlDataSource_customer.UpdateParameters["zipcode"].DefaultValue = Session["customer_zipcode"].ToString();
                SqlDataSource_customer.UpdateParameters["address"].DefaultValue = Session["customer_address"].ToString();
                SqlDataSource_customer.Update();

                GridView1.DataBind();


            }

            SqlDataSource_order.UpdateParameters["order_no"].DefaultValue = Session["order_no"].ToString();
            SqlDataSource_order.UpdateParameters["customer_id"].DefaultValue = Session["customer_id"].ToString();
            SqlDataSource_order.UpdateParameters["date"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource_order.UpdateParameters["order_sts"].DefaultValue = "1";
            SqlDataSource_order.Update();



            SqlDataSource_order_detail.DeleteParameters["order_no"].DefaultValue = Session["order_no"].ToString();
            SqlDataSource_order_detail.Delete();

            Response.Redirect("1-7finish.aspx");









        }
    }
}