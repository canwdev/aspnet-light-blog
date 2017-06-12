<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="admin_settings.aspx.cs" Inherits="dc_admin_admin_settings" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation" data-example-id="togglable-tabs">
            <ul id="myTabs" class="nav nav-sidebar">
                <li><a href="#settings_home" id="settings_home-tab" role="tab" data-toggle="tab" aria-controls="settings_home">网站设置</a></li>
                <li><a href="#settings_1" id="settings_1-tab" role="tab" data-toggle="tab" aria-controls="settings_1">开关</a></li>
                <%--<li><a href="#settings_2" id="settings_2-tab" role="tab" data-toggle="tab" aria-controls="settings_2">设置2</a></li>--%>
            </ul>
        </div>
        <div class="visible-xs">
            <hr />
        </div>

        <!--/span-->

        <div class="col-sm-9 col-md-10 main tab-content">
            <!--  -->
            <div role="tabpanel" class="tab-pane fade" id="settings_home" aria-labelledby="settings_home-tab">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btn_save_web_set">
                    <div class="bs-example bs-example-form">
                        <legend style="line-height: 39px;">网站设置
                        <div style="text-align: right; float: right;">
                            <asp:Button ID="btn_save_web_set" runat="server" class="btn btn-primary" Text="保存" OnClick="btn_SaveWebSet_Click" />
                        </div>
                        </legend>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="ContentPlaceHolder1_txt_site_title" class="col-sm-2 control-label">网站标题</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txt_site_title" runat="server" class="form-control" placeholder="网站标题" required="yes" autofocus="autofocus"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="ContentPlaceHolder1_txt_hreo_title" class="col-sm-2 control-label">首页标题</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txt_hreo_title" runat="server" class="form-control" placeholder="首页标题" required="yes"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txt_hreo_context" runat="server" class="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">链接的文章ID</label>
                                <div class="col-sm-1">
                                    <asp:TextBox ID="txt_hero_link_id" runat="server" class="form-control" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!-- 开关 -->
            <div role="tabpanel" class="tab-pane fade" id="settings_1" aria-labelledby="settings_1-tab">
                <div class="bs-example bs-example-form">
                    <legend style="line-height: 39px;">开关</legend>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="ContentPlaceHolder1_chk_set_regist_enabled" class="col-sm-2 control-label" style="line-height: 5px;">开启用户注册</label>
                            <div class="col-sm-5">
                                <asp:CheckBox ID="chk_set_regist_enabled" runat="server" OnCheckedChanged="chk_SetRegEna_Changed" AutoPostBack="True" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  -->
            <div role="tabpanel" class="tab-pane fade" id="settings_2" aria-labelledby="settings_2-tab">
                <div class="bs-example bs-example-form">
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
    </div>

</asp:Content>

