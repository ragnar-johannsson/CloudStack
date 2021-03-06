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

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.cloud.api.ApiConstants;
import com.cloud.api.BaseListCmd;
import com.cloud.api.Implementation;
import com.cloud.api.Parameter;
import com.cloud.api.response.ListResponse;
import com.cloud.api.response.NetworkOfferingResponse;
import com.cloud.offering.NetworkOffering;


@Implementation(description="Lists all available network offerings.", responseObject=NetworkOfferingResponse.class)
public class ListNetworkOfferingsCmd extends BaseListCmd {
    public static final Logger s_logger = Logger.getLogger(ListNetworkOfferingsCmd.class.getName());
    private static final String _name = "listnetworkofferingsresponse";

    /////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////
    @Parameter(name=ApiConstants.ID, type=CommandType.LONG, description="list network offerings by id")
    private Long id;
    
    @Parameter(name=ApiConstants.NAME, type=CommandType.STRING, description="list network offerings by name")
    private String networkOfferingName;
    
    @Parameter(name=ApiConstants.DISPLAY_TEXT, type=CommandType.STRING, description="list network offerings by display text")
    private String displayText;
    
    @Parameter(name=ApiConstants.TYPE, type=CommandType.STRING, description="list by type of the network")
    private String type;
    
    @Parameter(name=ApiConstants.TRAFFIC_TYPE, type=CommandType.STRING, description="list by traffic type")
    private String trafficType;
    
    @Parameter(name=ApiConstants.IS_DEFAULT, type=CommandType.BOOLEAN, description="true if need to list only default network offerings. Default value is false")
    private Boolean isDefault; 
    
    @Parameter(name=ApiConstants.SPECIFY_VLAN, type=CommandType.BOOLEAN, description="the tags for the network offering.")
    private Boolean specifyVlan;
    
    @Parameter(name=ApiConstants.IS_SHARED, type=CommandType.BOOLEAN, description="true is network offering supports vlans")
    private Boolean isShared; 
    
    @Parameter(name=ApiConstants.AVAILABILITY, type=CommandType.STRING, description="the availability of network offering. Default value is Required")
    private String availability; 

    /////////////////////////////////////////////////////
    /////////////////// Accessors ///////////////////////
    /////////////////////////////////////////////////////
    
    public String getNetworkOfferingName() {
        return networkOfferingName;
    }
    
    public String getDisplayText() {
        return displayText;
    }

    public String getType() {
        return type;
    }

    public String getTrafficType() {
        return trafficType;
    }

    public Long getId() {
        return id;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }
    
    public Boolean getSpecifyVlan() {
        return specifyVlan;
    }

    public Boolean getIsShared() {
        return isShared;
    }
    
    public String getAvailability() {
        return availability;
    }

    /////////////////////////////////////////////////////
    /////////////// API Implementation///////////////////
    /////////////////////////////////////////////////////
    @Override
    public String getCommandName() {
        return _name;
    }

    @Override
    public void execute(){
        List<? extends NetworkOffering> offerings = _configService.searchForNetworkOfferings(this);
        ListResponse<NetworkOfferingResponse> response = new ListResponse<NetworkOfferingResponse>();
        List<NetworkOfferingResponse> offeringResponses = new ArrayList<NetworkOfferingResponse>();
        for (NetworkOffering offering : offerings) {
            NetworkOfferingResponse offeringResponse = _responseGenerator.createNetworkOfferingResponse(offering);
            offeringResponses.add(offeringResponse);
        }

        response.setResponses(offeringResponses);
        response.setResponseName(getCommandName());
        this.setResponseObject(response);
    }
}
