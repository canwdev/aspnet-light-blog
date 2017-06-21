<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="admin_modify_info.aspx.cs" Inherits="dc_admin_admin_modify_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation" data-example-id="togglable-tabs">
            <ul id="myTabs" class="nav nav-pills nav-stacked">
                <li><a href="#admin_info_show" id="admin_info_show-tab" role="tab" data-toggle="tab" aria-controls="admin_info_show">概览</a></li>
                <li><a href="#admin_info_mod" id="admin_info_mod-tab" role="tab" data-toggle="tab" aria-controls="admin_info_mod">修改资料</a></li>
                <li><a href="#admin_pwd_mod" id="admin_pwd_mod-tab" role="tab" data-toggle="tab" aria-controls="admin_pwd_mod">修改密码</a></li>
            </ul>
        </div>
        <div class="visible-xs">
            <hr />
        </div>

        <div class="col-sm-9 col-md-10 main tab-content">
            <!-- 概览 -->
            <div role="tabpanel" class="tab-pane fade" id="admin_info_show" aria-labelledby="admin_info_show-tab">
                <iframe src="user_info.aspx" frameborder="0" width="100%" height="500"></iframe>
            </div>
            <!-- 修改信息 -->
            <div role="tabpanel" class="tab-pane fade" id="admin_info_mod" aria-labelledby="admin_info_mod-tab">
                <asp:Panel ID="Panel_mod_uinfo" runat="server" DefaultButton="btn_update_usrinfo_set">
                    <div class="bs-example bs-example-form">
                        <legend style="line-height: 39px;">修改资料
                        <div style="text-align: right; float: right;">
                            <asp:Button ID="btn_update_usrinfo_set" runat="server" class="btn btn-primary" Text="更新" OnClick="btn_UpUinfo_Click" />
                        </div>
                        </legend>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">头像</label>
                                <div class="col-sm-5">
                                    <asp:Image ID="img_headimg1" runat="server" Height="128" Width="128" class="img-thumbnail" />
                                    <div class="btn-group">
                                        <asp:Button ID="Button1" runat="server" Text="选择图片" ToolTip="推荐分辨率 128 x 128" CssClass="btn btn-default"
                                            OnClientClick="ContentPlaceHolder1_FileUpload1.click(); return false;" />
                                        <asp:Button ID="btn_upload_img" runat="server" Text="修改" CssClass="btn btn-default"
                                            OnClick="btn_UpImg_Click" CausesValidation="False" />
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                    <asp:FileUpload ID="FileUpload1" runat="server" Style="visibility: hidden" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">注册用户名</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txt_user_uname" runat="server" class="form-control" placeholder="注册用户名" required="yes" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">昵称</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txt_user_nickname" runat="server" class="form-control" placeholder="昵称" required="yes"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txt_user_intro" runat="server" class="form-control" placeholder="个性签名" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">ID</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txt_user_uid" runat="server" class="form-control" placeholder="UID" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-1" style="padding-top:10px;">
                                    <span class="label label-default">标识，不可修改。</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">组ID</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txt_user_gid" runat="server" class="form-control" placeholder="GID" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-1" style="padding-top:10px;">
                                    <span class="label label-default">0为管理员，1为用户。</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!-- 修改密码 -->
            <div role="tabpanel" class="tab-pane fade" id="admin_pwd_mod" aria-labelledby="admin_pwd_mod-tab">
                <asp:Panel ID="Panel_mod_pswd_disabled" runat="server" Visible="False" CssClass="text-center"><h3>无权修改该用户的密码。</h3></asp:Panel>
                <asp:Panel ID="Panel_mod_pswd" runat="server" DefaultButton="btn_modpwd">
                    <div class="col-md-5 bs-example bs-example-form">
                        <legend>修改密码</legend>
                        <div class="form-group">
                            <label>原始密码</label>
                            <asp:TextBox ID="txt_origin_password" runat="server" class="form-control" type="password"
                                name="password" placeholder="原始密码" autocomplete="on"></asp:TextBox>
                            <div style="text-align: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="密码不能为空" ControlToValidate="txt_origin_password"
                                    Display="Dynamic" ForeColor="#FF0066" ValidationGroup="vaild_mod_pswd"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>新密码</label>
                            <asp:TextBox ID="txt_new_password" runat="server" class="form-control" type="password"
                                name="password" placeholder="新密码" autocomplete="on"></asp:TextBox>
                            <div style="text-align: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="密码不能为空" ControlToValidate="txt_new_password"
                                    Display="Dynamic" ForeColor="#FF0066" ValidationGroup="vaild_mod_pswd"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>确认密码</label>
                            <asp:TextBox ID="txt_password_repeat" runat="server" class="form-control" type="password"
                                name="password" placeholder="确认密码" autocomplete="on"></asp:TextBox>
                            <div style="text-align: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="密码不能为空" ControlToValidate="txt_password_repeat"
                                    Display="Dynamic" ForeColor="#FF0066" ValidationGroup="vaild_mod_pswd"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ControlToCompare="txt_password_repeat" ControlToValidate="txt_new_password"
                                    ErrorMessage="&amp;nbsp密码不一致&amp;nbsp  " Display="Dynamic" ForeColor="#FF0066" ValidationGroup="vaild_mod_pswd"></asp:CompareValidator>
                            </div>
                        </div>
                        <div style="text-align: right;">
                            <div style="float: left;">
                                <asp:Label ID="lbl_modpwd_ok" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_modpwd_error" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                            </div>
                            <asp:Button ID="btn_modpwd" runat="server" class="btn" Text="修改"
                                OnClick="btn_modpwd_Click" ValidationGroup="vaild_mod_pswd" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <script>function goAdmin_pwd_mod() {
                    document.getElementById('admin_info_show').className = 'tab-pane fade';
                    document.getElementById('admin_info_mod').className = 'tab-pane fade';
                    document.getElementById('admin_pwd_mod').className = 'tab-pane fade active in';
                }
                function goAdmin_info_mod() {
                    document.getElementById('admin_info_show').className = 'tab-pane fade';
                    document.getElementById('admin_info_mod').className = 'tab-pane fade active in';
                    document.getElementById('admin_pwd_mod').className = 'tab-pane fade';
                }
            </script>
        </div>
    </div>

</asp:Content>

