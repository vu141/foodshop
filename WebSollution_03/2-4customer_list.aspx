<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2-4customer_list.aspx.cs" Inherits="WebSollution_03._2_4customer_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="顧客別売上集計"></asp:Label>
            <br />
            <div class="auto-style1">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="customer_id" DataSourceID="SqlDataSource_customer" GridLines="None" Width="719px" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="customer_id" HeaderText="顧客ID" ReadOnly="True" SortExpression="customer_id" />
                        <asp:BoundField DataField="customer_name" HeaderText="顧客名" SortExpression="customer_name" />
                        <asp:BoundField DataField="customer_kana" HeaderText="顧客カナ" SortExpression="customer_kana" />
                        <asp:BoundField DataField="tel" HeaderText="電話番号" SortExpression="tel" />
                        <asp:BoundField DataField="購入合計金額" DataFormatString="{0:c}" HeaderText="合計金額" ReadOnly="True" SortExpression="購入合計金額" />
                        <asp:BoundField DataField="購入商品点数" HeaderText="商品点数" ReadOnly="True" SortExpression="購入商品点数" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="選択" ShowHeader="True" Text="詳細" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </div>
            <br />
            　<asp:Button ID="Button_戻る" runat="server" BackColor="#FFCC66" Height="33px" OnClick="Button_戻る_Click" Text="戻る" Width="60px" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource_customer" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT customer.customer_id, customer.customer_name, customer.customer_kana, customer.tel, SUM(item.price * order_detail.quanlity) AS 購入合計金額, SUM(order_detail.quanlity) AS 購入商品点数 FROM order_detail INNER JOIN [order] ON order_detail.order_no = [order].order_no INNER JOIN item ON order_detail.item_id = item.item_id INNER JOIN customer ON [order].customer_id = customer.customer_id WHERE ([order].order_sts = 1) GROUP BY customer.customer_id, customer.customer_name, customer.customer_kana, customer.tel ORDER BY customer.customer_kana"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
