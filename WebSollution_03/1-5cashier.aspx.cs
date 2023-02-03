using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSollution_03
{
    public partial class _1_5cashier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack == false)
            {
                if(Session["customer_name"] != null)
                {
                    TextBox_name.Text = Session["customer_name"].ToString();
                    TextBox_kana.Text = Session["customer_kana"].ToString();

                }
                if (Session["customer_tel"] != null)
                {
                    TextBox_tel.Text = Session["customer_tel"].ToString() ;
                }
                if (Session["customer_zipcode"] != null)
                {
                    TextBox_zipcode.Text = Session["customer_zipcode"].ToString();
                }
                if (Session["customer_address"] != null)
                {
                    TextBox_address.Text = Session["customer_address"].ToString();

                }
            } 

        }

        protected void Buttona_next_Click(object sender, EventArgs e)
        {
            if(Page.IsValid == true)
            {
                Session_save();
                Response.Redirect("1-6confirm.aspx");

            }
            

        }

        

        protected void Button_save_Click(object sender, EventArgs e)
        {
            Session_save();


        }

        private void Session_save()
            //session save
        {
            Session["customer_name"] = TextBox_name.Text;
            Session["customer_kana"] = TextBox_kana.Text;
            Session["customer_tel"] = TextBox_tel.Text;
            Session["customer_zipcode"] = TextBox_zipcode.Text;
            Session["customer_address"] = TextBox_address.Text;
        }
    }
}