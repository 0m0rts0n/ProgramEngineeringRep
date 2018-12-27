<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="HospitalASP.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Главное меню</h2>
    </div>
        <asp:Button ID="AccountingWorksBtn" runat="server" Text="Учёты работ" OnClick="AccountingWorksBtn_Click" />
        <br />
        <br />
        <asp:Button ID="AccShiftDutiesBtn" runat="server" Text="Учёты работ по смене" OnClick="AccShiftDutiesBtn_Click" />
        <br />
        <br />
        <asp:Button ID="AgenciesBtn" runat="server" Text="Агентства" OnClick="AgenciesBtn_Click" />
        <br />
        <br />
        <asp:Button ID="AnalyzesBtn" runat="server" Text="Анализы" OnClick="AnalyzesBtn_Click" />
        <br />
        <br />
        <asp:Button ID="DoctorDischargesBtn" runat="server" Text="Выписки доктора" OnClick="DoctorDischargesBtn_Click" />
        <br />
        <br />
        <asp:Button ID="DoctorsBtn" runat="server" Text="Врачи" OnClick="DoctorsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="HistoryillingsBtn" runat="server" Text="Истории болезней" OnClick="HistoryillingsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="IllingsBtn" runat="server" Text="Болезни" OnClick="IllingsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="PatientCardsBtn" runat="server" Text="Карты пациентов" OnClick="PatientCardsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="PatientsBtn" runat="server" Text="Пациенты" OnClick="PatientsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="PoliciesBtn" runat="server" Text="Полисы" OnClick="PoliciesBtn_Click" />
        <br />
        <br />
        <asp:Button ID="ReceptionsBtn" runat="server" Text="Приёмы" OnClick="ReceptionsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="ShiftsBtn" runat="server" Text="Смены" OnClick="ShiftsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="SpecificationsBtn" runat="server" Text="Специальности" OnClick="SpecificationsBtn_Click" />
        <br />
        <br />
        <asp:Button ID="VisitsBtn" runat="server" Text="Визиты" OnClick="VisitsBtn_Click" />
    </form>
</body>
</html>
