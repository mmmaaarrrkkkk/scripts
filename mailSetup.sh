#!/bin/sh

liu=$(who | grep console | cut -f1 -d" ")  #gives the logged in user
plb="/usr/libexec/PlistBuddy" #sets the path to PlistBuddy
filepath="/Users/$liu/Library/Mail/V2/Maildata/Accounts.plist"    #Sets the path for the Accounts.plist file
mailserver="mail.spawar.navy.mil" #Sets the mail server as a variable, make sure to change this to your mail server
mailaddress="$liu@spawar.navy.mil"    #Sets the email address, make sure to change your mail domain after the @
realname=$(dscl . -read /Users/$liu RealName | tail -1 | cut -f2 -f3 -d" ")   #Gives the "real name" of the logged in user
desc="SPAWAR Mail" # this is the name given to the account that shows up in the Mail client
myuid1=$(uuidgen)   #creates a unique ID for outgoing(it's an apple default)
myuid2=$(uuidgen)   #creates a unique ID for incoming

#first we're going to quit mail and flush any existing settings
# !NOTE! - THIS WILL REMOVE ANY CURRENT MAIL SETTINGS!!!
killall Mail
rm -r /Users/$liu/Library/Mail

#the following lines creates the Mail structure because we're assuming this is a brand new user
mkdir /Users/$liu/Library/Mail
mkdir /Users/$liu/Library/Mail/V2
mkdir /Users/$liu/Library/Mail/V2/Maildata


#the following lines create the Accounts.plist that actually sets up the users mail.  These are all defaults that I saw created when I made an account with all my default settings
$plb -c 'Add AccountsVersion integer 3' $filepath
$plb -c 'Add DeliveryAccounts array' $filepath
$plb -c 'Add DeliveryAccounts: dict' $filepath
$plb -c "Add DeliveryAccounts:0:AccountName string $desc" $filepath
$plb -c 'Add DeliveryAccounts:0:AccountType string "SMTPAccount"' $filepath
$plb -c 'Add DeliveryAccounts:0:AuthenticationScheme string ""' $filepath
$plb -c 'Add DeliveryAccounts:0:ConfigureDynamically bool true' $filepath
$plb -c "Add DeliveryAccounts:0:Hostname string $mailserver" $filepath
$plb -c 'Add DeliveryAccounts:0:IsSyncable bool true' $filepath
$plb -c 'Add DeliveryAccounts:0:MaxMessageBytes integer 52428800' $filepath
$plb -c 'Add DeliveryAccounts:0:PortNumber string "25"' $filepath
$plb -c 'Add DeliveryAccounts:0:SSLEnabled string "YES"' $filepath
$plb -c 'Add DeliveryAccounts:0:SecurityLayerType integer 2' $filepath
$plb -c 'Add DeliveryAccounts:0:ShouldUseAuthentication string "YES"' $filepath
$plb -c 'Add DeliveryAccounts:0:UseDefaultPorts string "YES"' $filepath
$plb -c "Add DeliveryAccounts:0:Username string $liu" $filepath
$plb -c "Add DeliveryAccounts:0:uniqueId string $myuid1" $filepath
$plb -c 'Add MailAccounts array' $filepath
$plb -c 'Add MailAccounts: dict' $filepath
$plb -c 'Add MailAccounts:0:AccountPath string "~/Library/Mail/V2/Mailboxes"' $filepath
$plb -c 'Add MailAccounts:0:AccountType string "LocalAccount"' $filepath
$plb -c 'Add MailAccounts:0:ArchiveMailboxName string "Archive"' $filepath
$plb -c 'Add MailAccounts:0:ConfigureDynamically bool false' $filepath
$plb -c 'Add MailAccounts:0:DraftsMailboxName string "Drafts"' $filepath
$plb -c 'Add MailAccounts:0:IsSyncable bool true' $filepath
$plb -c 'Add MailAccounts:0:NotesMailboxName string "Notes"' $filepath
$plb -c 'Add MailAccounts:0:SentMessagesMailboxName string "Sent Messages"' $filepath
$plb -c 'Add MailAccounts:0:TrashMailboxName string "Deleted Messages"' $filepath
$plb -c 'Add MailAccounts:0:uniqueId string "LocalAccountId"' $filepath
$plb -c 'Add MailAccounts: dict' $filepath
$plb -c "Add MailAccounts:1:AccountName string $desc" $filepath
$plb -c "Add MailAccounts:1:AccountPath string ~/Library/Mail/V2/IMAP-$liu@$mailserver" $filepath
$plb -c 'Add MailAccounts:1:AccountType string "IMAPAccount"' $filepath
$plb -c 'Add MailAccounts:1:ArchiveMailboxName string "Archive"' $filepath
$plb -c 'Add MailAccounts:1:ConfigureDynamically bool false' $filepath
$plb -c 'Add MailAccounts:1:DraftsMailboxName string "Drafts"' $filepath
$plb -c 'Add MailAccounts:1:EmailAddresses array' $filepath
$plb -c "Add MailAccounts:1:EmailAddresses:0 string $mailaddress" $filepath
$plb -c "Add MailAccounts:1:FullUserName string $realname" $filepath
$plb -c "Add MailAccounts:1:Hostname string $mailserver" $filepath
$plb -c 'Add MailAccounts:1:IsSyncable bool true' $filepath
$plb -c 'Add MailAccounts:1:NotesMailboxName string "Notes"' $filepath
$plb -c 'Add MailAccounts:1:PortNumber string "143"' $filepath
$plb -c "Add MailAccounts:1:SMTPIdentifier string $mailserver:$liu" $filepath
$plb -c 'Add MailAccounts:1:SSLEnabled string "YES"' $filepath
$plb -c 'Add MailAccounts:1:SecurityLayerType integer 2' $filepath
$plb -c 'Add MailAccounts:1:SentMessagesMailboxName string "Sent Messages"' $filepath
$plb -c 'Add MailAccounts:1:StoreDraftsOnServer string "YES"' $filepath
$plb -c 'Add MailAccounts:1:StoreSentMessagesOnServer string "YES"' $filepath
$plb -c 'Add MailAccounts:1:ToDosMailboxName string "Apple Mail To Do"' $filepath
$plb -c 'Add MailAccounts:1:TrashMailboxName string "Deleted Messages"' $filepath
$plb -c "Add MailAccounts:1:Username string $liu" $filepath
$plb -c "Add MailAccounts:1:uniqueId string $myuid2" $filepath
$plb -c 'Add OutboxMailboxPath string "~/Library/Mail/V2/Mailboxes/Outbox.mbox"' $filepath

chown $liu $filepath    #gives user permission to their Accounts plist
chown -R $liu /Users/$liu/Library/Mail  #gives the user permission to their Mail folder structure