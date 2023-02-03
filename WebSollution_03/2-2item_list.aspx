<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2-2item_list.aspx.cs" Inherits="WebSollution_03._2_2item_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="商品一覧"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button_new" runat="server" BackColor="#66FF66" ForeColor="#333300" Text="商品新規追加" OnClick="Button_new_Click" />
            <br />
            <div class="auto-style1">
                <asp:GridView ID="GridView_item" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="item_id" DataSourceID="SqlDataSource_item_order" GridLines="None" Height="150px" Width="583px" OnRowCommand="GridView_item_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="選択">
                            <ItemTemplate>
                                <asp:Button ID="Button_保守" runat="server" CausesValidation="False" CommandArgument='<%# Eval("item_id") %>' CommandName="Select" Text="保守" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品画像" SortExpression="imgurl">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imgurl") %>'></asp:TextBox>
                            
</EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("imgurl") %>' />
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="item_id" HeaderText="商品ID" ReadOnly="True" SortExpression="item_id" />
                        <asp:BoundField DataField="item_name" HeaderText="商品名" SortExpression="item_name" />
                        <asp:BoundField DataField="sum_sales" DataFormatString="{0:c}" HeaderText="売上金額" ReadOnly="True" SortExpression="sum_sales" />
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
            <asp:Button ID="Button_戻る" runat="server" OnClick="Button_戻る_Click" Text="戻る" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource_item_order" runat="server" OnSelecting="SqlDataSource_item_order_Selecting" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT item.item_id, item.item_name, item.imgurl, SUM(View_order_dec.quanlity * item.price * 1.05) AS sum_sales FROM item LEFT OUTER JOIN View_order_dec ON item.item_id = View_order_dec.item_id GROUP BY item.item_id, item.item_name, item.imgurl ORDER BY item.item_id"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
