<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_24#></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">
<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>

<script>
var $j = jQuery.noConflict();
<% smartdns_status(); %>

$j(document).ready(function(){
	init_itoggle('sdns_enable');
	init_itoggle('snds_redirect');
});

function initial(){
	show_banner(2);
	show_menu(5,16);
	show_footer();
	fill_status(smartdns_status_code);
}

function applyRule(){
	showLoading();
	document.form.action_mode.value = " Restart ";
	document.form.current_page.value = "Advanced_smartdns.asp";
	document.form.next_page.value = "";
	document.form.submit();
}

function restartRule(){
	showLoading();
	document.form.action_mode.value = " Restart ";
	document.form.current_page.value = "Advanced_smartdns.asp";
	document.form.next_page.value = "";
	document.form.submit();
}

function fill_status(status_code){
	var stext = "Unknown";
	if (status_code == 0)
		stext = "<#Stopped#>";
	else if (status_code == 1)
		stext = "<#Running#>";
	$("smartdns_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
}
</script>
</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3"><center><div id="logo"></div></center></div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_smartdns.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="SmartdnsConf;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu5_24#></h2>
                            <div class="round_bottom">
								<div>
									<div class="alert alert-info" style="margin: 10px;">
										SmartDNS 自定义版：仅保留启动开关与自定义配置编辑。<br>
										配置文件：/etc/storage/smartdns_custom.conf
									</div>
								</div>

								<div id="wnd_sm_cfg">
									<table width="100%" cellpadding="4" cellspacing="0" class="table">
										<tr> <th width="50%"><#running_status#></th>
											<td id="smartdns_status" colspan="2"></td>
										</tr>
										<tr> <th><#menu5_21_1#></th>
											<td>
												<div class="main_itoggle">
												<div id="sdns_enable_on_of">
													<input type="checkbox" id="sdns_enable_fake" <% nvram_match_x("", "sdns_enable", "1", "value=1 checked"); %><% nvram_match_x("", "sdns_enable", "0", "value=0"); %>>
												</div>
												</div>
												<div style="position: absolute; margin-left: -10000px;">
													<input type="radio" value="1" name="sdns_enable" id="sdns_enable_1" <% nvram_match_x("", "sdns_enable", "1", "checked"); %>><#checkbox_Yes#>
													<input type="radio" value="0" name="sdns_enable" id="sdns_enable_0" <% nvram_match_x("", "sdns_enable", "0", "checked"); %>><#checkbox_No#>
												</div>
											</td>
										</tr>
										<tr> <th>自动修改DNS</th>
											<td>
												<div class="main_itoggle">
												<div id="snds_redirect_on_of">
													<input type="checkbox" id="snds_redirect_fake" <% nvram_match_x("", "snds_redirect", "1", "value=1 checked"); %><% nvram_match_x("", "snds_redirect", "0", "value=0"); %>>
												</div>
												</div>
												<div style="position: absolute; margin-left: -10000px;">
													<input type="radio" value="1" name="snds_redirect" id="snds_redirect_1" <% nvram_match_x("", "snds_redirect", "1", "checked"); %>>开启
													<input type="radio" value="0" name="snds_redirect" id="snds_redirect_0" <% nvram_match_x("", "snds_redirect", "0", "checked"); %>>关闭
												</div>
												<div style="color:#888; font-size:11px;">开启后自动将 SmartDNS 设为 dnsmasq 上游服务器（端口 6053）</div>
											</td>
										</tr>
									</table>
								</div>

								<div id="wnd_sm_cou">
									<table width="100%" cellpadding="2" cellspacing="0" class="table">
										<tr>
											<td colspan="2">
												<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script11')"><span>自定义设置 (smartdns_custom.conf)</span></a>
												<div id="script11">
													<textarea rows="16" wrap="off" spellcheck="false" class="span12" name="scripts.smartdns_custom.conf" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.smartdns_custom.conf",""); %></textarea>
													<div style="color:#888; font-size:11px; margin-top:4px;">
														直接编辑 smartdns_custom.conf 配置文件内容，支持 SmartDNS 所有配置指令。保存后将重启 SmartDNS 生效。
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>

								<table class="table">
									<tr>
										<td colspan="6">
											<center>
												<input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" />
												<input class="btn btn-warning" style="width: 120px; margin-left: 10px;" type="button" value="重启 SmartDNS" onclick="restartRule()" />
											</center>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    </form>
    <div id="footer"></div>
</div>

</body>
</html>
