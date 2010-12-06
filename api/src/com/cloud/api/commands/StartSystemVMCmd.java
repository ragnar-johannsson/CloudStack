/**
 *  Copyright (C) 2010 Cloud.com, Inc.  All rights reserved.
 * 
 * This software is licensed under the GNU General Public License v3 or later.
 * 
 * It is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */

package com.cloud.api.commands;

import org.apache.log4j.Logger;

import com.cloud.api.ApiConstants;
import com.cloud.api.BaseAsyncCmd;
import com.cloud.api.BaseCmd;
import com.cloud.api.Implementation;
import com.cloud.api.Parameter;
import com.cloud.api.ServerApiException;
import com.cloud.api.response.SystemVmResponse;
import com.cloud.async.AsyncJob;
import com.cloud.event.EventTypes;
import com.cloud.user.Account;
import com.cloud.user.UserContext;
import com.cloud.vm.VirtualMachine;

@Implementation(responseObject=SystemVmResponse.class, description="Starts a system virtual machine.")
public class StartSystemVMCmd extends BaseAsyncCmd {
	public static final Logger s_logger = Logger.getLogger(StartSystemVMCmd.class.getName());

    private static final String s_name = "startsystemvmresponse";
    
    /////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////

    @Parameter(name=ApiConstants.ID, type=CommandType.LONG, required=true, description="The ID of the system virtual machine")
    private Long id;

    /////////////////////////////////////////////////////
    /////////////////// Accessors ///////////////////////
    /////////////////////////////////////////////////////

    public Long getId() {
        return id;
    }

    /////////////////////////////////////////////////////
    /////////////// API Implementation///////////////////
    /////////////////////////////////////////////////////

    @Override
    public String getName() {
        return s_name;
    }
    
    public static String getResultObjectName() {
    	return "systemvm"; 
    }

    @Override
    public long getEntityOwnerId() {
        Account account = UserContext.current().getAccount();
        if (account != null) {
            return account.getId();
        }

        return Account.ACCOUNT_ID_SYSTEM; // no account info given, parent this command to SYSTEM so ERROR events are tracked
    }

    @Override
    public String getEventType() {
        return EventTypes.EVENT_SSVM_START;
    }

    @Override
    public String getEventDescription() {
        return  "starting system vm: " + getId();
    }
    
    public AsyncJob.Type getInstanceType() {
    	return AsyncJob.Type.SystemVm;
    }
    
    public Long getInstanceId() {
    	return getId();
    }
	
    @Override
    public void execute(){
        VirtualMachine instance = _mgr.startSystemVM(this);
        if (instance != null) {
            SystemVmResponse response = _responseGenerator.createSystemVmResponse(instance);
            response.setResponseName(getName());
            this.setResponseObject(response);
        } else {
            throw new ServerApiException(BaseCmd.INTERNAL_ERROR, "Fail to start system vm");
        }
    }
}