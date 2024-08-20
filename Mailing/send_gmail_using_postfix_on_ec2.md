
# In this file we are going to know how to send a simple Gmail from ec2 instance using Postfix mail transfer agent.

To configure Postfix to send emails using Gmail's SMTP server with authentication, you need to set up SASL (Simple Authentication and Security Layer) and configure Postfix to use Gmail's SMTP server. Here’s a step-by-step guide to do this:

### **1. Install Postfix and SASL Packages**

If you haven’t already installed Postfix and SASL, do so with the following commands:

Command: sudo apt-get update
Command: sudo apt-get install postfix libsasl2-2 sasl2-bin libsasl2-modules

----------------------------------------------------------------------------------------


### **2. Configure Postfix**

Edit the Postfix main configuration file (`/etc/postfix/main.cf`) to use Gmail’s SMTP server:

Command: sudo vim /etc/postfix/main.cf

Add or modify the following lines to configure Postfix:

----------------------------------------------------------------------------------------

# Specify Gmail's SMTP server as the relay host

relayhost = [smtp.gmail.com]:587

----------------------------------------------------------------------------------------

# Enable SASL authentication
smtp_sasl_auth_enable = yes
smtp_sasl_security_options = noanonymous
smtp_sasl_password_maps = hash:/etc/postfix/sasl/passwd
smtp_sasl_tls_security_options = noanonymous
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
smtp_use_tls = yes

----------------------------------------------------------------------------------------

# Optional: Set the hostname
myhostname = yourdomain.com
Replace `yourdomain.com` with your domain or leave it as is if you don't have one.

----------------------------------------------------------------------------------------


### **3. Create the SASL Password File**
Create the `/etc/postfix/sasl/passwd` file to store your Gmail credentials:
    Command: sudo vim /etc/postfix/sasl/passwd
Add the following line to this file:

[smtp.gmail.com]:587 example@gmail.com:your_app_password

Replace `example@gmail.com` with your Gmail address and `your_app_password` with the App Password you generated for your Gmail account.

----------------------------------------------------------------------------------------


### **4. Secure the SASL Password File**

Set the correct permissions for the password file to ensure it is secure:

sudo chmod 600 /etc/postfix/sasl/passwd

Generate the hash db file that Postfix will use:

    Command:sudo postmap /etc/postfix/sasl/passwd

----------------------------------------------------------------------------------------
### **5. Restart Postfix**

Restart Postfix to apply the changes:

sudo systemctl restart postfix

----------------------------------------------------------------------------------------


### **6. Verify Configuration**

To test if your configuration works, try sending an email from the command line:

Command: echo "Test email body" | mail -s "Test email subject" recipient@example.com

Replace `recipient@example.com` with the email address you want to send the test message to.

----------------------------------------------------------------------------------------


### **Additional Notes**

- **App Password:** If you have 2-Step Verification enabled for your Google account, you’ll need to create an App Password. You can do this from your Google Account settings under "Security."
- **TLS Certificates:** Ensure you have the necessary CA certificates installed. The path `/etc/ssl/certs/ca-certificates.crt` should be valid; if not, adjust accordingly.

This setup should enable Postfix to relay emails through Gmail’s SMTP server using authentication. If you encounter any issues, check the Postfix logs for errors:

```bash
sudo tail -f /var/log/mail.log
```








