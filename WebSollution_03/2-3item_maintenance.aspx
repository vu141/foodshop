<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2-3item_maintenance.aspx.cs" Inherits="WebSollution_03._2_3item_maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 303px;
        }
        .auto-style2 {
            width: 288px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="商品の保守"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#FF9933" BorderStyle="Dashed" />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="font-weight: normal; background-color: #66FF99">
                        <asp:Label ID="Label_商品ID" runat="server" Font-Bold="True" Text="商品ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_商品ID" runat="server" Width="70px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_商品ID" ErrorMessage="商品IDを入力してください" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <br />
                        半角5桁　入力列 : 00123</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-weight: normal; background-color: #66FF99">
                        <asp:Label ID="Label_商品名" runat="server" Font-Bold="True" Text="商品名"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_商品名" runat="server" Width="271px" Height="16px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_商品名" ErrorMessage="商品名を入力してください" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                        全角　最大50文字</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-weight: normal; background-color: #66FF99">
                        <asp:Label ID="Label_税抜き単価" runat="server" Font-Bold="True" Text="税抜き単価"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_税抜き単価" runat="server" Width="78px"></asp:TextBox>
                        円<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_税抜き単価" ErrorMessage="税抜き単価を入力してください" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-weight: normal; background-color: #66FF99">
                        <asp:Label ID="Label_商品画像" runat="server" Font-Bold="True" Text="商品画像"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image_item" runat="server" Height="71px" Width="77px" />
                        <asp:Label ID="Label_imgurl" runat="server"></asp:Label>
                        <br />
                        <asp:FileUpload ID="FileUpload_imgurl" runat="server" Height="25px" Width="259px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="Label_msg" runat="server"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button_戻る" runat="server" BackColor="#FFCC66" BorderColor="#CCFF99" Font-Bold="False" Text="戻る" OnClick="Button_戻る_Click" />
&nbsp;
            <asp:Button ID="Button_追加" runat="server" BackColor="#FFCC66" BorderColor="#CCFF99" Font-Bold="False" Text="追加" OnClick="Button_追加_Click" />
&nbsp;
            <asp:Button ID="Button_更新" runat="server" BackColor="#FFCC66" BorderColor="#CCFF99" Font-Bold="False" Text="更新" OnClick="Button_更新_Click" />
&nbsp;
            <asp:Button ID="Button_削除" runat="server" BackColor="#FFCC66" BorderColor="#CCFF99" Font-Bold="False" Text="削除" OnClick="Button_削除_Click" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource_item" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" DeleteCommand="delete from item where item_id= @item_id" InsertCommand="insert into item (item_id , item_name , price , imgurl) values(@item_id,@item_name,@price,@imgurl)" SelectCommand="select * from item where item_id = @item_id" UpdateCommand="update item set (item_name = @item_name, price = @price, imgurl= @imgurl) where item_id = @item_id">
                <DeleteParameters>
                    <asp:Parameter Name="item_id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="item_id" />
                    <asp:Parameter Name="item_name" />
                    <asp:Parameter Name="price" />
                    <asp:Parameter Name="imgurl" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="item_id" SessionField="item_id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="item_name" />
                    <asp:Parameter Name="price" />
                    <asp:Parameter Name="imgurl" />
                    <asp:Parameter Name="item_id" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
