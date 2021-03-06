﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="COMP214_GROUP14.Instructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server">Instuctor was saved successfully.</span>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-user"></span>&nbsp;Add Instuctor</h3>
            </div>
            <div class="panel-body">
                              <div class="row">
                    <div class="form-inline">
                        <div class="col-md-3">
                            <label for="txtfName">First Name:</label>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtfName" runat="server" MaxLength="50"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rvtxtfName" runat="server" ControlToValidate="txtfName" ErrorMessage="First Name is mandatory."></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-inline">
                        <div class="col-md-3">
                            <label for="txtlName">Last Name:</label>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtlName" runat="server" MaxLength="50"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rvtxtCredit" runat="server" ControlToValidate="txtlName" ErrorMessage="Last Name is mandatory."></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row form-inline">
                    <div class="col-md-3"></div>
                    <div class="col_md-9">
                        <button id="btnAdd"
                            data-toggle="tooltip" data-placement="left"
                            title="This command button will insert a instructor record to instructors table."
                            class="btn btn-primary" runat="server" onserverclick="btnAdd_ServerClick">
                            &nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
                        <button id="btnCancel" type="reset" class="btn btn-default" runat="server" causesvalidation="False">&nbsp;&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;Cancel&nbsp;&nbsp;</button>
                    </div>
                    <br />
                </div>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                    <EmptyDataTemplate>
                        <table runat="server" class="table">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="INSTRUCTOR_IDLabel" runat="server" Text='<%# Eval("INSTRUCTOR_ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FNAMELabel" runat="server" Text='<%# Eval("FNAME") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LNAMELabel" runat="server" Text='<%# Eval("LNAME") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NumberOfCoursesLabel" runat="server" Text='<%# Eval("NumberOfCourses") %>' />
                            </td>
                            <td>
                                <asp:Button ID="DeleteItemButton"
                                    runat="server"
                                    CssClass="btn btn-primary"
                                    CommandName="DeleteItem"
                                    CommandArgument='<%# Eval("INSTRUCTOR_ID") %>'
                                    Text="Delete"
                                    OnClientClick="return confirm('Are you absolutely sure you want to delete this instructor and his courses?');"
                                    data-toggle="tooltip" data-placement="right"
                                    title="This command button will invoke DELETE_INSTRUCTOR_SP procedure. DELETE ALL from courseinstructor which are the FK with the instructor." />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>

                        <table id="itemPlaceholderContainer" runat="server" class="table table-hover table-striped">
                            <tr runat="server">
                                <th runat="server">INSTRUCTOR_ID</th>
                                <th runat="server">FNAME</th>
                                <th runat="server">LNAME</th>
                                <th runat="server">NUMBER OF COURSES</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>

                    </LayoutTemplate>

                </asp:ListView>

            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT INSTRUCTOR_ID, FNAME, LNAME, NumberOfCourses FROM vw_instructor ORDER BY INSTRUCTOR_ID"></asp:SqlDataSource>

</asp:Content>
