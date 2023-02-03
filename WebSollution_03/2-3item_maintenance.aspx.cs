using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebSollution_03
{
    public partial class _2_3item_maintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                if (Session["item_id"].ToString() == "999999")
                {
                    //商品の新規追加処理
                    Button_追加.Enabled = true;
                    Button_更新.Enabled = false;
                    Button_削除.Enabled = false;


                }
                else
                if(!(Session["item_id"].Equals("")))
                {

                    //商品の保守処理
                    Button_追加.Enabled = false;
                    Button_更新.Enabled = true;
                    Button_削除.Enabled =  true;
                    
                    DataSourceSelectArguments args= new DataSourceSelectArguments();
                    DataView dataView = (DataView)(SqlDataSource_item.Select(args));

                    if (dataView.Table.Rows.Count > 0)
                    {
                        TextBox_商品ID.Text = Session["item_id"].ToString();
                        TextBox_商品名.Text = dataView.Table.Rows[0].ItemArray.GetValue(1).ToString();
                        TextBox_税抜き単価.Text = dataView.Table.Rows[0].ItemArray.GetValue(2).ToString();
                        Label_imgurl.Text = dataView.Table.Rows[0].ItemArray.GetValue(3).ToString();
                        Image_item.ImageUrl = dataView.Table.Rows[0].ItemArray.GetValue(3).ToString();

                    }
                }

                
            }

           

        }

        protected void Button_追加_Click(object sender, EventArgs e)
        {
            String filename = "";
            bool flag = true;
            if(FileUpload_imgurl.HasFile == true)
            {
                filename = "~/img/" + FileUpload_imgurl.FileName;
            }

            try
            {
                SqlDataSource_item.InsertParameters["item_id"].DefaultValue = TextBox_商品ID.Text;
                SqlDataSource_item.InsertParameters["item_name"].DefaultValue = TextBox_商品名.Text;
                SqlDataSource_item.InsertParameters["price"].DefaultValue = TextBox_税抜き単価.Text;
                SqlDataSource_item.InsertParameters["imgurl"].DefaultValue = filename;
                SqlDataSource_item.Insert();


            }catch (Exception err)
            {
                Label_msg.Text = err.Message;
                flag = false;
            }
            finally
            {

            }

            if (flag)
            {
                if(FileUpload_imgurl.HasFile == true)
                {
                    //画像をアップロードする
                    String path = Server.MapPath(filename);
                    FileUpload_imgurl.PostedFile.SaveAs(path);
                }
            }

            Response.Redirect("2-2item_list.aspx");
            
        }

        protected void Button_更新_Click(object sender, EventArgs e)
        {
            String filename = "";

            if (FileUpload_imgurl.HasFile == true)
            {
                filename = "~/img/" + FileUpload_imgurl.FileName;
            }
            else
            {
                filename = Label_imgurl.Text;
            }

            try
            {
                SqlDataSource_item.UpdateParameters["item_id"].DefaultValue = TextBox_商品ID.Text;
                SqlDataSource_item.UpdateParameters["item_name"].DefaultValue = TextBox_商品名.Text;
                SqlDataSource_item.UpdateParameters["price"].DefaultValue = TextBox_税抜き単価.Text;
                SqlDataSource_item.UpdateParameters["imgurl"].DefaultValue = filename;
                SqlDataSource_item.Update();

            }catch(Exception err)
            {
                Label_msg.Text = err.Message;

            }
            finally
            {

            }
            if(Label_msg.Text == "")
            {
                if(FileUpload_imgurl.HasFile == true)
                {
                    //画像をアップロードする
                    String path = Server.MapPath(filename);
                    FileUpload_imgurl.PostedFile.SaveAs(path);


                }
            }

           
            Response.Redirect("2-2item_list.aspx");


        }

        protected void Button_削除_Click(object sender, EventArgs e)
        {
            SqlDataSource_item.DeleteParameters["item_id"].DefaultValue = TextBox_商品ID.Text;
            
            try
            {
                SqlDataSource_item.Delete();

            }
            catch(Exception err)
            {
                Label_msg.Text = err.Message;

            }
            finally
            {

            }
            if(Label_msg.Text == "")
            {
                Response.Redirect("2-2item_list.aspx");

            }

            
           
        }

        protected void Button_戻る_Click(object sender, EventArgs e)
        {
            Response.Redirect("2-2item_list.aspx");

        }
    }
}