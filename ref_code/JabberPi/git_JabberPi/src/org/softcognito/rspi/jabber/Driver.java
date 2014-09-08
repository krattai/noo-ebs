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

package org.softcognito.rspi.jabber;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

import org.jhub1.system.env.Env;
import org.jhub1.system.xmpp.commands.NewMessageProcessor;
import org.jhub1.system.xmpp.config.ConfigAdapter;
import org.jhub1.system.xmpp.log.LogAdapter;
import org.jhub1.system.xmpp.proxy.XMPPProxy;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
//import org.softcognito.rspi.jabber.comm.ElementPl;
import org.softcognito.rspi.jabber.comm.ElementPy;
//import org.softcognito.rspi.jabber.comm.ElementRb;
import org.softcognito.rspi.jabber.comm.ElementUptime;

public class Driver {

	private static NewMessageProcessor mproc;
	private static LogAdapter log = LogAdapter.getLog(Driver.class);
	private static ConfigAdapter config = ConfigAdapter.getInstance(log);

	public static void main(String[] args) throws IOException {
		Thread.currentThread().setName("RaspberryPI Jabber");

		log.info("RaspberryPI Jabber starting. SMACK version: "
				+ SmackConfiguration.getVersion());

		config.addConfig(Env
				.getLocalConfig("/home/marek/workspaceJuno/PiJabber/src/JabberPi.config"));

		mproc = new NewMessageProcessor();
		mproc.registerElement("uptime", new ElementUptime());
	//	mproc.registerElement("pl", new ElementPl());
		mproc.registerElement("py", new ElementPy());
	//	mproc.registerElement("rb", new ElementRb());
		
		final XMPPProxy conXm;

		try {
			conXm = new XMPPProxy(mproc);
			log.info("Initiating Jabber engine, setting status.");
			XMPPProxy.setStatus(config.getInitialStatus());

			while (true) {
				try {
					Thread.sleep(90);
				} catch (InterruptedException ex) {
					log.fatal(ex.toString());
				}
				try {
					conXm.incomeChat();
				} catch (InterruptedException ex) {
					log.fatal(ex.toString());
				}
			}
		} catch (XMPPException ex) {
			log.fatal(ex.toString());
		}

	}
}
