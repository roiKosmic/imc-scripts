#**************************************************************************
# Identification:get_partion_info.tcl
# Purpose:       get device partion info
#**************************************************************************

sleep 1

send "terminal length 0\r"
send "dir\r"
set loop true

while {$loop == "true"} {
	expect {
		-re $more_prompt {
			send " "
		} -re "Error|Unknown command" {
    		set error_message $expect_out(1,string)
			expect -re $exec_prompt
			set ERROR_RESULT  true
			set ERROR_MESSAGE "Device error: $error_message"
			set loop false
		} -re $exec_prompt {
			# Done
			set loop false
		} -re $enable_prompt {
			# Done
			set loop false
		} 
	}		
}
