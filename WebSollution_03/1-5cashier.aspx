<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-5cashier.aspx.cs" Inherits="WebSollution_03._1_5cashier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 100%;
        }
        .auto-style25 {
            width: 321px;
        }
        .auto-style26 {
            width: 243px;
            text-align: right;
        }
        .auto-style27 {
            margin-left: 0px;
        }
        .auto-style28 {
            width: 243px;
            text-align: right;
            height: 38px;
        }
        .auto-style29 {
            width: 321px;
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        顧客情報入力</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" BorderColor="Aqua" BorderStyle="Dotted" />
    <p class="auto-style30">
        *必ず入力してください。</p>
    <table class="auto-style23">
        <tr>
            <td class="auto-style28">*<asp:Label ID="Label_name" runat="server" Text="お名前"></asp:Label>
            </td>
            <td class="auto-style29" style="font-size: 10px; color: #808080">
                <asp:TextBox ID="TextBox_name" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_name" ErrorMessage="名前を入力してください" ForeColor="Red">*</asp:RequiredFieldValidator>
                <br />
                全角　姓と名の間を１文字空けて下さい</td>
        </tr>
        <tr>
            <td class="auto-style26">*<asp:Label ID="Label_kana" runat="server" Text="フリガナ"></asp:Label>
            </td>
            <td class="auto-style25" style="font-size: 10px; color: #808080">
                <asp:TextBox ID="TextBox_kana" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_kana" ErrorMessage="フリガナで入力してください。" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                <br />
                全角　姓と名の間を１文字空けて下さい</td>
        </tr>
        <tr>
            <td class="auto-style26">
                <asp:Label ID="Label_tel" runat="server" Text="電話番号"></asp:Label>
            </td>
            <td class="auto-style25" style="font-size: 10px; color: #808080">
                <asp:TextBox ID="TextBox_tel" runat="server" CssClass="auto-style27"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_tel" ErrorMessage="電話番号の形式が正しくありません" ForeColor="Red" Display="Dynamic" ValidationExpression="(0\d{1,4}-|\(0\d{1,4}\) ?)?\d{1,4}-\d{4}">*</asp:RegularExpressionValidator>
                <br />
                半角　入力列:048-526-0919</td>
        </tr>
        <tr>
            <td class="auto-style26">
                <asp:Label ID="Label_zipcode" runat="server" Text="郵便番号"></asp:Label>
            </td>
            <td class="auto-style25" style="font-size: 10px; color: #808080">
                <asp:TextBox ID="TextBox_zipcode" runat="server" Width="148px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_zipcode" ErrorMessage="郵便番号の形式が正しくありません" ForeColor="Red" Display="Dynamic" ValidationExpression="\d{3}(-(\d{4}|\d{2}))?">*</asp:RegularExpressionValidator>
                <br />
                半角 入力列:360-0046</td>
        </tr>
        <tr>
            <td class="auto-style26">
                <asp:Label ID="Label_address" runat="server" Text="住所"></asp:Label>
            </td>
            <td class="auto-style25" style="font-size: 10px; color: #808080">
                <asp:TextBox ID="TextBox_address" runat="server"></asp:TextBox>
                <br />
                全角 入力列:埼玉県熊谷市鎌倉町124</td>
        </tr>
    </table>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_save" runat="server" Height="32px" OnClick="Button_save_Click" Text="入力内容を保存" Width="133px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buttona_next" runat="server" Height="29px" OnClick="Buttona_next_Click" Text="次へ" Width="70px" />
    </p>
</asp:Content>
