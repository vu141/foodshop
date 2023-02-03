<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-6confirm.aspx.cs" Inherits="WebSollution_03._1__6confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 99%;
        }
        .auto-style24 {
            width: 86px;
            text-align: right;
            background-color: #FF9900;
        }
        .auto-style25 {
            color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        最終確認画面</p>
    <p>
        ■顧客情報を確認してください</p>
    <table class="auto-style23">
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label11" runat="server" Text="お名前"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_name" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label12" runat="server" Text="フリガナ"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_kana" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label13" runat="server" Text="電話番号"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_tel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label14" runat="server" Text="郵便番号"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_zipcode" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label15" runat="server" Text="住所"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_address" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
        ■注文内容を確認してください</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource_view_order" EmptyDataText="商品が選択されていません" GridLines="Horizontal" Height="171px" Width="473px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="item_id" HeaderText="商品ID" SortExpression="item_id" />
                <asp:BoundField DataField="item_name" HeaderText="商品名" SortExpression="item_name" />
                <asp:BoundField DataField="price_with_tax" DataFormatString="{0:c}" HeaderText="税込単価" ReadOnly="True" SortExpression="price_with_tax" />
                <asp:BoundField DataField="quanlity" HeaderText="購入数量" SortExpression="quanlity" />
                <asp:BoundField DataField="total_price_wt" DataFormatString="{0:c}" HeaderText="税込金額" ReadOnly="True" SortExpression="total_price_wt" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_戻る" runat="server" OnClick="Button_戻る_Click" Text="戻る" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_注文確定" runat="server" CssClass="auto-style25" OnClick="Button_注文確定_Click" Text="注文確定" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource_view_order" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT [item_id] , [item_name], [price_with_tax], [quanlity], [total_price_wt] FROM [View_order] WHERE (order_no = @order_no) AND (quanlity&gt;0)">
            <SelectParameters>
                <asp:SessionParameter Name="order_no" SessionField="order_no" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_customer" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" InsertCommand="INSERT INTO customer(customer_id, customer_name, customer_kana, tel, zipcode, address) VALUES (@customer_id, @customer_name, @customer_kana, @tel, @zipcode, @address)" SelectCommand="select customer_id,customer_name,customer_kana,tel, zipcode,address
from customer
where customer_id= @customer_id" UpdateCommand="UPDATE customer SET customer_kana = @customer_kana, customer_name = @customer_name, tel = @tel, zipcode = @zipcode, address = @address WHERE (customer_id = @customer_id)">
            <InsertParameters>
                <asp:Parameter Name="customer_name" />
                <asp:Parameter Name="customer_kana" />
                <asp:Parameter Name="tel" />
                <asp:Parameter Name="zipcode" />
                <asp:Parameter Name="address" />
                <asp:Parameter Name="customer_id" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="customer_id" SessionField="customer_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="customer_kana" />
                <asp:Parameter Name="customer_name" />
                <asp:Parameter Name="tel" />
                <asp:Parameter Name="zipcode" />
                <asp:Parameter Name="address" />
                <asp:Parameter Name="customer_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_order" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" InsertCommand="INSERT  [order] (order_no, customer_id, date, order_sts) VALUES (@order_no, @customer_id, @date, @order_sts)" SelectCommand="SELECT MAX(order_no) AS order_no_max FROM [order]" UpdateCommand="UPDATE [order] SET customer_id = @customer_id, date = @date, order_sts = @order_sts WHERE (order_no = @order_no)">
            <InsertParameters>
                <asp:Parameter Name="order_no" />
                <asp:Parameter Name="customer_id" />
                <asp:Parameter Name="date" />
                <asp:Parameter Name="order_sts" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="customer_id" />
                <asp:Parameter Name="date" />
                <asp:Parameter Name="order_sts" />
                <asp:Parameter Name="order_no" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_order_detail" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" DeleteCommand="DELETE FROM order_detail WHERE (order_no = @order_no) AND (quanlity = 0)" InsertCommand="insert into [order_detail] (order_no,item_id,quanlity) values (@order_no,@item_id,@quanlity)" SelectCommand="select order_no,item_id,quanlity from order_detail where order_no=@order_no and item_id=@item_id" UpdateCommand="update order_detail set quanlity=@quanlity where item_id=@item_id and order_no=@order_no">
            <DeleteParameters>
                <asp:Parameter Name="order_no" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="order_no" />
                <asp:Parameter Name="item_id" />
                <asp:Parameter Name="quanlity" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="order_no" SessionField="order_no" />
                <asp:Parameter Name="item_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="quanlity" />
                <asp:Parameter Name="item_id" />
                <asp:Parameter Name="order_no" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
</asp:Content>
