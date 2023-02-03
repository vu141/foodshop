<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-2top.aspx.cs" Inherits="WebSollution_03._1_2top2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 97%;
        }
        .auto-style24 {
            text-align: right;
            width: 63px;
            height: 24px;
        }
        .auto-style25 {
            width: 127px;
            height: 24px;
        text-align: right;
    }
        .auto-style26 {
            height: 24px;
        text-align: right;
    }
    .auto-style27 {
        height: 24px;
        width: 101px;
    }
    .auto-style28 {
        height: 24px;
        width: 98px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        ログイン</p>
    <table class="auto-style23">
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label_顧客ID" runat="server" Text="顧客ID"></asp:Label>
            </td>
            <td class="auto-style25">
                <asp:TextBox ID="TextBox_customer_id" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style27">
                <asp:Button ID="Button_ログイン" runat="server" Text="ログイン" OnClick="Button_ログイン_Click" />
            </td>
            <td class="auto-style28">
                <asp:Label ID="Label_msg" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style26">
                <asp:Button ID="Button_ログオフ" runat="server" Text="ログオフ" Enabled="False" OnClick="Button_ログオフ_Click" />
            </td>
        </tr>
    </table>
    <p>
        新着情報</p>
<p>
        <asp:SqlDataSource ID="SqlDataSource_customer" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDBConnectionString %>" SelectCommand="select customer_id,customer_name,customer_kana,tel, zipcode,address
from customer
where customer_id= @customer_id">
            <SelectParameters>
                <asp:SessionParameter Name="customer_id" SessionField="customer_id" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>
