//%attributes = {}
// Start receiving of the mail list according to the number of mail defined by Form.numberMails
var $listID; ListRef : Integer
ARRAY LONGINT:C221($arr; 0)
If (Is a list:C621(ListRef))
	$listID:=Selected list items:C379(ListRef; $arr; *)
	
	// search the box information of the selected box
	Form:C1466.currentMailbox:=Form:C1466.mailboxes.search($listID)
	If (Form:C1466.currentMailbox#Null:C1517)
		// select the box as current box on the IMAP server
		Form:C1466.IMAP.selectBox(Form:C1466.currentMailbox.name)
		
	Else 
		// select the box as current box on the IMAP server
		Form:C1466.IMAP.selectBox()
		
	End if 
	
	// start the downoad of the emails
	Form:C1466.receiveMails:=cs:C1710.EmailDownloading.new(Form:C1466.IMAP.transporter; Form:C1466.numberMails; Form:C1466.IMAP.selectedBox)
	Form:C1466.receiveMails.startTimer()
End if 