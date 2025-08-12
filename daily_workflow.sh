#!/bin/bash
log_file="$HOME/coding/daily_workflow.log"

start_day(){
	echo "$(date) -Starting workday" >> "$log_file"
	gedit ~/python/test.py &
	code 
	
}
lunch_break(){
	echo "$(date) -Lunch break reminder" >> "$log_file"
	echo ">>>>>>>> TIME FOR LUNCH <<<<<<"
}
end_day(){
	echo "$(date) - Shutting down work">>"$log_file"
	pkill  gedit 
	pkill  code
	echo ">>>>>> WORKDAY COMPLETE <<<<<<"
}
notify(){
	export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
	export DISPLAY=:0
	if command -v notify-send >/dev/null;then
		notify-send   "$1"
	fi
	
}
case "$1" in
	start)
		notify  "Let's get Started!!!Let's Collaborate and Innovate!!"
			 start_day ;;
	lunch) 
		notify "**LunchTime Bliss**Pause for Flavour-"
			lunch_break ;;
 
	end) 
			
                notify "Time to clock Out...Kindly save your progress"
			sleep 10
		notify "I'm proud of your progress!!!That's a wrap!!"
		        sleep 5
			end_day ;;
	*)
		echo "{start|lunch|end}"
esac
