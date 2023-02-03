using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebSollution_03
{
    public partial class _1_2top : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList_item_ItemCommand(object source, DataListCommandEventArgs e)
        {



            int order_no = 0;
            //セッションオブジェクト[order_no]存在しないとき
            if (Session["order_no"] == null)
            {
                order_no = GetNew_order_no();

                SqlDataSource_order.InsertParameters["order_no"].DefaultValue = order_no.ToString();
                SqlDataSource_order.InsertParameters["customer_id"].DefaultValue = "0";
                SqlDataSource_order.InsertParameters["date"].DefaultValue = DateTime.Now.ToString();
                SqlDataSource_order.InsertParameters["order_sts"].DefaultValue = "0";
                SqlDataSource_order.Insert();

                Session["order_no"] = order_no;
            }

            else
            {
                order_no = (int)Session["order_no"];
            }

            //注文明細テーブルの更新
            //注文明細テーブルからDataViewオブジェクトに同一伝票番号、同一商品iDのレコードを検索する。
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            SqlDataSource_order_detail.SelectParameters["item_id"].DefaultValue = e.CommandArgument.ToString();
            DataView dataView = (DataView)SqlDataSource_order_detail.Select(args);

            if(dataView.Table.Rows.Count > 0)
            {
                int quanlity = (int)dataView.Table.Rows[0].ItemArray.GetValue(2) + 1;
                SqlDataSource_order_detail.UpdateParameters["item_id"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSource_order_detail.UpdateParameters["quanlity"].DefaultValue = quanlity.ToString();
                SqlDataSource_order_detail.Update();

            }
            else
            {
                SqlDataSource_order_detail.InsertParameters["item_id"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSource_order_detail.InsertParameters["quanlity"].DefaultValue = "1";
                SqlDataSource_order_detail.Insert();
            }

            Master.Get_Summary();
            




        }

        protected int GetNew_order_no()
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView dataview = (DataView)SqlDataSource_order.Select(args);
            int order_no = 1;
            if (dataview.Table.Rows[0].ItemArray.GetValue(0) != DBNull.Value)
            {
                order_no = (int)dataview.Table.Rows[0].ItemArray.GetValue(0) + 1;
            }

            return order_no;
        }

        //注文テーブル更新

        //注文テーブルから　DataView オブジェクト
       // DataSourceSelectArguments args =new DataSourceSelectArguments();
       
       

    }
}