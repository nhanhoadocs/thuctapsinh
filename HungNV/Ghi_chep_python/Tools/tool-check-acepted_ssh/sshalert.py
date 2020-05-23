#!/usr/bin/env python

import logging
import os, time
import subprocess, select
import requests
import re

# Initialization
log = logging.getLogger('sshalert')
log.setLevel(logging.INFO)

#TOKEN =
#CHAT_ID = 
HOSTNAME = os.popen('hostname').read()

def poll_logfile(filename):
    """
    Polls a logfile for sudo commands or ssh logins.
    """
    f = subprocess.Popen(["tail", "-f", "-n", "0", filename], encoding="utf8", stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    p = select.poll()
    p.register(f.stdout)

    while True:
        if p.poll(1):
            process_log_entry(f.stdout.readline())
        time.sleep(1)


def process_log_entry(logline):
    """
    Check a logline and see if it matches the content we care about.
    """
    # If it's a local sudo exec
    if "sudo" and "COMMAND" in logline:
        send_sms(logline)

    # If it's an SSH login
    elif "ssh" and "Accepted" in logline:
        send_sms(logline)
    return

def send_sms(msg):
    """
    Sends a text message to the target phone number, via nexmo.
    Returns 0 if everything worked; otherwise 1
    """
    # Send a message
    response = requests.post(
        "https://api.telegram.org/bot{}/sendMessage?chat_id={}&text=LOG FROM : {} \n{}"
        .format(TOKEN, CHAT_ID, HOSTNAME, msg))

    # Error handling
#    if response['messages'][0]['status'] != '0':
#        logging.error("ERROR: failed to send message: {0}".format(response['messages'][0]['error-text']))
#    else:
#        logging.info("Successfully sent text message.")

# If this program was called directly (as opposed to imported)
checkOS = os.popen('cat /etc/*release | grep "^ID="').read()
oS = checkOS[3:-1]
if oS == '"centos"':
    if __name__ == "__main__":
        poll_logfile("/var/log/secure")
else:
    if __name__ == "__main__":
        poll_logfile("/var/log/auth.log")
