/**
* Copyright 2013 SoftCognito.org
*
* All rights reserved. Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package org.softcognito.rspi.jabber.comm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.jhub1.system.xmpp.commands.Element;
import org.jhub1.system.xmpp.commands.Executable;
import org.jhub1.system.xmpp.commands.RequestMessage;
import org.jhub1.system.xmpp.commands.ReturnMessage;

public class ElementUptime extends Element implements Executable {

	public ElementUptime() {
		this.name = "uptime";
		this.description = "Shows the system uptime";
	}
	
	@Override
	public ReturnMessage executeCommand(RequestMessage msg) {
		ReturnMessage rm = new ReturnMessage(msg);
		StringBuilder output = new StringBuilder();
		Process p;
		try {
			p = Runtime.getRuntime().exec("uptime");
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				output.append(line);
			}
			if(output.length() > 0) {
				rm.setExtStatus(ReturnMessage.SUCCEEDED);
				rm.setMessage(output.toString());
			} else {
				rm.setExtStatus(ReturnMessage.FAILED);
				rm.setMessage("uptime system error 1");
			}
		} catch (IOException e) {
			rm.setExtStatus(ReturnMessage.FAILED);
			rm.setMessage("uptime system error 2");
		}
		return rm;
	}

}
