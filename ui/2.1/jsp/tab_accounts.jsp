<%@ page import="java.util.Date" %>
<%
long milliseconds = new Date().getTime();
%>
	
<!-- Accounts -->
<div class="maincontent" style="display:block;" id="submenu_content_account">
	<div id="maincontent_title">
    	<div class="maintitle_icon"> <img src="images/accountstitle_icons.gif" title="routers" /> </div>
		<h1>Accounts</h1>
        <!-- <a class="add_newaccbutton" href="#"></a> -->
		<div class="search_formarea">
			<form action="#" method="post">
				<ol>
					<li><input class="text" type="text" name="search_input" id="search_input" /></li>
				</ol>
			</form>
			<a class="search_button" id="search_button" href="#"></a>
			<div id="advanced_search_link" class="advsearch_link">Advanced</div>
            <div id="advanced_search" class="adv_searchpopup" style="display: none;">
                <div class="adv_searchformbox">
                    <h3>
                        Advance Search</h3>
                        <a id="advanced_search_close" href="#">Close </a>
                    <form action="#" method="post">
                    <ol>
                        <li>
                            <label for="filter">
                                Name:</label>
                            <input class="text" type="text" name="adv_search_name" id="adv_search_name" />
                        </li>                        
                        <li>
                            <label for="filter">Role:</label>
                        	<select class="select" id="adv_search_role">
								<option value=""></option>
								<option value="1">Admin</option>
								<option value="0">User</option>								
                            </select>
                        </li>                                              
                    </ol>
                    </form>
                   
                    <div class="adv_search_actionbox">
                    	<div class="adv_searchpopup_button" id="adv_search_button"></div>
					</div>
                </div>
            </div>
		</div>
	</div>
     <div class="filter_actionbox">
    	
    </div>
	<div class="grid_container">
    	<div id="loading_gridtable" class="loading_gridtable">
                  <div class="loading_gridanimation"></div>
                   <p>Loading...</p>
        </div> 
		<div class="grid_header">
        	<div class="grid_genheader_cell" style="width:13%;">
				<div class="grid_headertitles">Role</div>
			</div>			
        	<div class="grid_genheader_cell" style="width:15%;">
				<div class="grid_headertitles">Account</div>
			</div>
			<div class="grid_genheader_cell" style="width:15%;">
				<div class="grid_headertitles">Domain</div>
			</div>
			<div class="grid_genheader_cell" style="width:5%;">
				<div class="grid_headertitles">VMs</div>
			</div>
			<div class="grid_genheader_cell" style="width:5%;">
				<div class="grid_headertitles">IPs</div>
			</div>
            <div class="grid_genheader_cell" style="width:10%;">
				<div class="grid_headertitles">Bytes Received</div>
			</div>
            <div class="grid_genheader_cell" style="width:10%;">
				<div class="grid_headertitles">Bytes Sent</div>
			</div>
            <div class="grid_genheader_cell" style="width:7%;">
				<div class="grid_headertitles">State</div>
			</div>
			<div class="grid_genheader_cell" style="width:17%;">
				<div class="grid_headertitles">Actions</div>
			</div>
		</div>
		<div id="grid_content">
        	 
        </div>
	</div>
    <div id="pagination_panel" class="pagination_panel" style="display:none;">
    	<p id="grid_rows_total" />
    	<div class="pagination_actionbox">
        	<div class="pagination_actions">
            	<div class="pagination_actionicon"><img src="images/pagination_refresh.gif" title="refresh" /></div>
                <a id="refresh" href="#"> Refresh</a>
            </div>
            <div class="pagination_actions" id="prevPage_div">
            	<div class="pagination_actionicon"><img src="images/pagination_previcon.gif" title="prev" /></div>
                <a id="prevPage" href="#"> Prev</a>
            </div>
            <div class="pagination_actions" id="nextPage_div">
            	<div class="pagination_actionicon"><img src="images/pagination_nexticon.gif" title="next" /></div>
                <a id="nextPage" href="#"> Next</a>
            </div>
        </div>
    </div>
</div>

<!-- Accounts Template -->
<div id="account_template" style="display:none">
    <div class="adding_loading" style="height: 24px; display: none;" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Waiting &hellip;
        </div>
    </div>
    <div id="account_body">
        <div class="grid_smallgenrow_cell" style="width:13%;">
		    <div class="netgrid_celltitles" id="account_role"></div>
	    </div>	   
	    <div class="grid_smallgenrow_cell" style="width:15%;">
		    <div class="netgrid_celltitles" id="account_accountname"></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:15%;">
		    <div class="netgrid_celltitles" id="account_domain"></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:5%;">
		    <div class="netgrid_celltitles" id="account_vms"><a href="#" id="account_vms_link">N</a></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:5%;">
		    <div class="netgrid_celltitles" id="account_ips"><a href="#" id="account_ips_link">N</a></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:10%;">
		    <div class="netgrid_celltitles" id="account_received"></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:10%;">
		    <div class="netgrid_celltitles" id="account_sent"></div>
	    </div>
        <div class="grid_smallgenrow_cell" style="width:7%;">
		    <div class="netgrid_celltitles" id="account_state"></div>
	    </div>
	    <div class="grid_smallgenrow_cell" style="width:17%;" id="action_links">
		    <div class="netgrid_celltitles">
		        <span id="account_resource_limits_container">
		            <a href="#" id="account_resource_limits">Resource Limits</a> | 
		        </span>
		        <span id="account_enable_container">
		            <a href="#" id="account_enable">Enable</a> | 
		        </span>
		        <span id="account_disable_container">
		            <a href="#" id="account_disable">Disable</a> 
		        </span>             
		    </div> 
	    </div>
	</div>
</div>

<div id="dialog_resource_limits" title="Resource Limits" style="display:none">
	<p>Please specify limits to the various resources.  A "-1" means the resource has no limits.</p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label for="user_name">Instance Limit:</label>
					<input class="text" type="text" name="limits_vm" id="limits_vm" value="-1" />
					<div id="limits_vm_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label for="user_name">Public IP Limit:</label>
					<input class="text" type="text" name="limits_ip" id="limits_ip" value="-1" />
					<div id="limits_ip_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label for="user_name">Disk Volume Limit:</label>
					<input class="text" type="text" name="limits_volume" id="limits_volume" value="-1" />
					<div id="limits_volume_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label for="user_name">Snapshot Limit:</label>
					<input class="text" type="text" name="limits_snapshot" id="limits_snapshot" value="-1" />
					<div id="limits_snapshot_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label for="user_name">Template Limit:</label>
					<input class="text" type="text" name="limits_template" id="limits_template" value="-1" />
					<div id="limits_template_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
			</ol>
		</form>
	</div>
</div>

<!-- disable or lock an account (begin) -->
<div id="dialog_disable_account" title="Disable Account" style="display:none">	
    <p>Select <b>"Disable"</b> to prevent account access to the cloud and to shut down all existing virtual instances.<br></br>
       Select <b>"Lock"</b> to ONLY prevent account access to the cloud. <br></br>
    </p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form1">
			<ol>		
				<li>
					<label>Action: </label>
					<select class="select" id="change_state_type">
						<option value="disable" selected>Disable</option>
						<option value="lock">Lock</option>
					</select>
				</li>
			</ol>
		</form>
	</div>
</div>
<!-- disable or lock an account (end) -->