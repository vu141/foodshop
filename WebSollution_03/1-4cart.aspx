<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-4cart.aspx.cs" Inherits="WebSollution_03._1_4cart" %>
<%@ MasterType VirtualPath =" ~/eshop.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        カートの中身</p>
    <p class="auto-style23">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource_view_order" GridLines="Vertical" EmptyDataText="カートに商品がありません"  Width="565px" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="item_id" HeaderText="商品ID" SortExpression="item_id" />
                <asp:BoundField DataField="item_name" HeaderText="商品名" SortExpression="item_name" />
                <asp:BoundField DataField="price_with_tax" DataFormatString="{0:c}" HeaderText="税込単価" HtmlEncode="False" SortExpression="price_with_tax" ReadOnly="True" />
                <asp:TemplateField HeaderText="購入数量" SortExpression="quanlity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quanlity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox_quanlity" runat="server" Text='<%# Bind("quanlity") %>'　style="text-align:right"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="total_price_wt" DataFormatString="{0:c}" HeaderText="税込金額" HtmlEncode="False" ReadOnly="True" SortExpression="total_price_wt" />
                <asp:ButtonField ButtonType="Button" CommandName="_upd" HeaderText="更新" ShowHeader="True" Text="更新" />
                <asp:ButtonField ButtonType="Button" CommandName="_del" HeaderText="削除" ShowHeader="True" Text="削除" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="Label_msg" runat="server"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource_view_order" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="SELECT [item_id] , [item_name], [price_with_tax], [quanlity], [total_price_wt] FROM [View_order] WHERE order_no = @order_no" >
            <SelectParameters>
                <asp:SessionParameter Name="order_no" SessionField="order_no" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_order_detail" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" InsertCommand="insert into [order_detail] (order_no,item_id,quanlity) values (@order_no,@item_id,@quanlity)" SelectCommand="select order_no,item_id,quanlity from order_detail where order_no=@order_no and item_id=@item_id" UpdateCommand="update order_detail set quanlity=@quanlity where item_id=@item_id and order_no=@order_no" DeleteCommand="delete from [order_detail] where item_id= @item_id and order_no =@order_no">
            <DeleteParameters>
                <asp:Parameter Name="item_id" />
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
</asp:Content>
