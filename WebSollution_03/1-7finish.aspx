<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-7finish.aspx.cs" Inherits="WebSollution_03._1_7finish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 91%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        ご購入ありがとうございました。</p>
    <table class="auto-style23">
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" BackColor="White" ForeColor="Red" Text="顧客ID:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_customer_id" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="顧客名"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_customer_name" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    続けて購入される場合、TOP画面からログインしてください。<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Lime" NavigateUrl="~/1-2top.aspx">ログイン</asp:HyperLink>
</asp:Content>
