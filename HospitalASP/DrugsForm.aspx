<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrugsForm.aspx.cs" Inherits="HospitalASP.DrugsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="DrugsForm" runat="server">
    <div>
        <asp:TextBox ID="drugTxt" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Поиск" OnClick="btnSearch_Click"/>
<hr/>
<asp:GridView ID="DrugsGV" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="DrugID" HeaderText="ИД лекарства"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="DrugProviderID" HeaderText="ИД поставщика лекарства"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="DrugName" HeaderText="Наименование лекарства"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="DrugPurpose" HeaderText="Назначение лекарства"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="IsPrescriptionAllowed" HeaderText="Отпускается по рецепту"/>
    </Columns>
</asp:GridView>
    </div>
    </form>
</body>
</html>
