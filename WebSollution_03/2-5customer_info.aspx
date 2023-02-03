<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2-5customer_info.aspx.cs" Inherits="WebSollution_03._2_5customer_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 99%;
        }
        .auto-style2 {
            width: 204px;
        }
        .auto-style4 {
            width: 109px;
            height: 20px;
        }
        .auto-style5 {
            height: 20px;
        }
        .auto-style6 {
            width: 109px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="商品別売上集計"></asp:Label>
            <br />
            <br />
            顧客情報<br />
            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" DataKeyNames="customer_id" DataSourceID="SqlDataSource_customer" Height="204px" Width="668px" CellSpacing="1">
                <EditItemTemplate>
                    customer_id:
                    <asp:DynamicControl ID="customer_idDynamicControl" runat="server" DataField="customer_id" Mode="ReadOnly" />
                    <br />
                    customer_name:
                    <asp:DynamicControl ID="customer_nameDynamicControl" runat="server" DataField="customer_name" Mode="Edit" />
                    <br />
                    customer_kana:
                    <asp:DynamicControl ID="customer_kanaDynamicControl" runat="server" DataField="customer_kana" Mode="Edit" />
                    <br />
                    tel:
                    <asp:DynamicControl ID="telDynamicControl" runat="server" DataField="tel" Mode="Edit" />
                    <br />
                    zipcode:
                    <asp:DynamicControl ID="zipcodeDynamicControl" runat="server" DataField="zipcode" Mode="Edit" />
                    <br />
                    address:
                    <asp:DynamicControl ID="addressDynamicControl" runat="server" DataField="address" Mode="Edit" />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <InsertItemTemplate>
                    customer_id:
                    <asp:DynamicControl ID="customer_idDynamicControl" runat="server" DataField="customer_id" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    customer_name:
                    <asp:DynamicControl ID="customer_nameDynamicControl" runat="server" DataField="customer_name" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    customer_kana:
                    <asp:DynamicControl ID="customer_kanaDynamicControl" runat="server" DataField="customer_kana" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    tel:
                    <asp:DynamicControl ID="telDynamicControl" runat="server" DataField="tel" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    zipcode:
                    <asp:DynamicControl ID="zipcodeDynamicControl" runat="server" DataField="zipcode" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    address:
                    <asp:DynamicControl ID="addressDynamicControl" runat="server" DataField="address" Mode="Insert" ValidationGroup="Insert" />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="挿入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style6">顧客ID</td>
                            <td>
                                <asp:Label ID="Label_customer_id" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6" rowspan="2">顧客名</td>
                            <td class="auto-style5">
                                <asp:Label ID="Label_customer_kana" runat="server" Text='<%# Bind("customer_kana") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label_customer_name" runat="server" Text='<%# Bind("customer_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">住所</td>
                            <td class="auto-style5">〒<asp:Label ID="Label_zipcode" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                                <asp:Label ID="Label_address" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">電話番号</td>
                            <td>
                                <asp:Label ID="Label_customer_tel" runat="server" Text='<%# Bind("tel") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </asp:FormView>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="item_id" DataSourceID="SqlDataSource_uriage" GridLines="None" Height="195px" Width="609px">
                <Columns>
                    <asp:TemplateField HeaderText="商品画像" SortExpression="imgurl">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imgurl") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgurl") %>' Width="40px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="item_id" HeaderText="ID" ReadOnly="True" SortExpression="item_id" />
                    <asp:BoundField DataField="item_name" HeaderText="商品名" SortExpression="item_name" />
                    <asp:BoundField DataField="price" DataFormatString="{0:c}" HeaderText="単価" SortExpression="price" />
                    <asp:BoundField DataField="quanlity" HeaderText="数量" SortExpression="quanlity" />
                    <asp:BoundField DataField="金額" DataFormatString="{0:c}" HeaderText="金額" ReadOnly="True" SortExpression="金額" />
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
            <br />
            &nbsp;
            <asp:Button ID="Button_戻る" runat="server" OnClick="Button_戻る_Click" Text="戻る" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource_customer" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT customer_id, customer_name, customer_kana, tel, zipcode, address FROM customer WHERE (customer_id = @customer_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="customer_id" SessionField="customer_id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_uriage" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT item.imgurl, item.item_id, item.item_name, item.price, order_detail.quanlity, item.price * order_detail.quanlity AS 金額, [order].customer_id FROM order_detail INNER JOIN item ON order_detail.item_id = item.item_id INNER JOIN [order] ON order_detail.order_no = [order].order_no WHERE ([order].customer_id = @customer_id) AND ([order].order_sts = 1) ORDER BY item.item_id">
                <SelectParameters>
                    <asp:SessionParameter Name="customer_id" SessionField="customer_id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
