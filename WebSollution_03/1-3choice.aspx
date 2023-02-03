<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="<1-3choice.aspx.cs" Inherits="WebSollution_03._1_2top" %>

<%@ MasterType VirtualPath="~/eshop.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <style type="text/css">
    .auto-style14 {
        margin-left: 0px;
    }
    .auto-style15 {
        margin-left: 0px;
        width: 343px;
    }
    .auto-style16 {
        color: #003300;
        margin-left: 0px;
        background-color: #FFFFFF;
    }
    .auto-style18 {
        width: 172px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
                                【新着情報】</p>
    <p>
                                &nbsp;</p>
    <p>
                                &nbsp;</p>
<p>
                                &nbsp;</p>
<p>
                                
      <asp:DataList ID="DataList_item" runat="server" DataKeyField="item_id" DataSourceID="SqlDataSource_item" RepeatColumns="2" CssClass="auto-style19" OnItemCommand="DataList_item_ItemCommand">
        <ItemTemplate>
            &nbsp;<br />&nbsp;<br />
            <table align="left" class="auto-style14" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCFF66; border-right-style: solid; border-right-width: thin; border-right-color: #CCFF33;">
                <tr>
                    <td class="auto-style15">
                        <asp:Image ID="Image_imgurl" runat="server" ImageUrl='<%# Eval("imgurl") %>' Width="100px" />
                    </td>
                    <td class="auto-style18">
                        <asp:Label ID="item_nameLabel" runat="server" Font-Size="X-Large" Text='<%# Eval("item_name") %>' />
                        <br />
                        &nbsp;<br />
                        <asp:Label ID="item_idLabel" runat="server" Text='<%# Eval("item_id") %>' />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="PriceWithTaxLabel" runat="server" CssClass="auto-style16" Text='<%# Eval("PriceWithTax","税込価格:{0:#,###,##0}円") %>' style="color: #FF0000" />
                        <br />
                        &nbsp;<br />
                        <asp:Button ID="Button_cart" runat="server" Text="カートに入れる" CssClass="btn-css" CommandArgument='<%# Eval("item_id") %>' />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</p>
<asp:SqlDataSource ID="SqlDataSource_item" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT item_id, item_name, imgurl, price * 1.1 AS PriceWithTax FROM item"></asp:SqlDataSource>
<p>
    <asp:SqlDataSource ID="SqlDataSource_order" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" InsertCommand="INSERT  [order] (order_no, customer_id, date, order_sts) VALUES (@order_no, @customer_id, @date, @order_sts)" SelectCommand="SELECT MAX(order_no) AS order_no_max FROM [order]">
        <InsertParameters>
            <asp:Parameter Name="order_no" />
            <asp:Parameter Name="customer_id" />
            <asp:Parameter Name="date" />
            <asp:Parameter Name="order_sts" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_order_detail" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" InsertCommand="insert into [order_detail] (order_no,item_id,quanlity) values (@order_no,@item_id,@quanlity)" SelectCommand="select order_no,item_id,quanlity from order_detail where order_no=@order_no and item_id=@item_id
" UpdateCommand="update order_detail set quanlity=@quanlity where item_id=@item_id and order_no=@order_no">
        <InsertParameters>
            <asp:SessionParameter Name="order_no" SessionField="order_no" />
            <asp:Parameter Name="item_id" />
            <asp:Parameter DefaultValue="1" Name="quanlity" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="order_no" SessionField="order_no" />
            <asp:Parameter Name="item_id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="quanlity" />
            <asp:Parameter Name="item_id" />
            <asp:SessionParameter Name="order_no" SessionField="order_no" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
