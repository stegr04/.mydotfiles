# Set path to include location of nolioos folder.
export nolioos_home="${HOME}/opt/nolioos"
export PATH=${PATH}:${nolioos_home}:${nolioos_home}/TroubleShooting:${HOME}/opt/ratools

# Set path to include location of rs tools
export PATH=${PATH}:${HOME}/code/logentry-rs/target/release

#alias raview='cd "${nolioos_home}/logs"; gvim'
# SECTION TO ASSIST WITH NAVIGATING rel
cdr() {
	cd "${nolioos_home}"
}

pullr() {
	printf '%\n' "${YELLOW}Doing a git pull of nolioos${RESET}"
	cd "${nolioos_home}"
	git pull
}

function clear_analysis_folder() {
	# SET ANALYSIS FOLDER/FILE
	analysis_folder="ANALYSIS"
	analysis_file_summary=${analysis_folder}/ANALYSIS.out
	if [ ! -d $analysis_folder ]; then {
    	#Create directory
    		mkdir $analysis_folder
	} else {
    		rm -rf ${analysis_folder}
    		mkdir ${analysis_folder}
	}
	fi
}


function generate_analysis_summary() {
  printf '\n\n%s\n' "========================" >> ${analysis_file_summary}
  printf '%s\n' "ANALYSIS FILE TIMESTAMPS" >> ${analysis_file_summary}
  printf '%s\n' "========================" >> ${analysis_file_summary}
  # Include the begin/end timestamp information for each log
  for file in $(ls ${analysis_folder}/*.log)
  do 
	  printf '%s\n' "${file}:" >> ${analysis_file_summary}
	  printf '\t%s\n' "begin: $(head -n1 ${file} | grep -oE "[0-9]...-[0-9].-[0-9]. [0-9].:[0-9].:[0-9].,[0-9]..")" >> ${analysis_file_summary}
	  printf '\t%s\n' "end:   $(tail -n1 ${file} | grep -oE "[0-9]...-[0-9].-[0-9]. [0-9].:[0-9].:[0-9].,[0-9]..")" >> ${analysis_file_summary}
  done

  printf '\n\n%s\n' "==============" >> ${analysis_file_summary}
  printf '%s\n' "ANALYSIS FILES" >> ${analysis_file_summary}
  printf '%s\n' "==============" >> ${analysis_file_summary}
  #
  for file in $(ls ${analysis_folder}/*.log)
  do 
	  #printf '%s\n' "jboss.awk ${analysis_folder}/${file} | less -+S" >> ${analysis_file_summary}
	  # Removing ${analysis_folder} variable from print message since it seems to already be included as a part of the ${file} variable.
	  printf '%s\n' "jboss.awk ${file} | less -+S" >> ${analysis_file_summary}
  done
  
  
  cat ${analysis_file_summary}

}


# Functions that help gather frequently reviewed logs into one inclusive file (per file type: nimi.log, nimi.log.1, etc.. > all_nimi.log)
function combinenag() {
	clear_analysis_folder
	ls healthmonitor_nag.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/healthmonitor.log; done
	ls nimi.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nimi.log; done
	ls nolio_action_exe.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_action_exe.log; done
	ls nolio_all.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_all.log; done
	ls nolio_perf_mon_nag.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_perfmon_nag.log; done
	ls sql_actions.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/sql_actions.log; done
	ls was_actions_wsadmin.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/was_actions_wsadmin.log; done
	ls wrapper.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/wrapper.log; done
	generate_analysis_summary
	
	#rm all_combinenag.out all_nimi.log all_nolio_action_exe.log all_nolio_all.log
#	ls nimi* | sort -Vr | while read line; do cat $line >> all_nimi.log; done
#	ls nolio_action_exe* | sort -Vr | while read line; do cat $line >> all_nolio_action_exe.log; done
#	ls nolio_all* | sort -Vr | while read line; do cat $line >> all_nolio_all.log; done
#  echo "jboss.awk all_nimi.log | less -+S" > all_combinenag.out
#  echo "jboss.awk all_nolio_action_exe.log | less -+S" >> all_combinenag.out
#  echo "jboss.awk all_nolio_all.log | less -+S" >> all_combinenag.out
#  cat all_combinenag.out

}

function combinenes() {
	clear_analysis_folder
  ls admin* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/admin.log; done
  ls active_mq_nes* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/active_mq_nes.log; done
  ls catalina.[0-9]*.log | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/catalina.log; done
  ls catalina.out* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/catalina.out; done
  ls execution.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/execution.log; done
  ls healthmonitor_es.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/healthmonitor_es.log; done
  #ls host-manager.[0-9]*.log | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/host-manager.log; done
  #ls localhost.[0-9]*.log | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/host-manager.log; done
  #ls manager.[0-9]*.log | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/manager.log; done
  ls nimi.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nimi.log; done
  ls nolio_exec_all.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_exec_all.log; done
  ls nolio_nes_activemq_stats.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_nes_activemq_stats.log; done
  ls nolio_perf_mon_nes.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_perf_mon_nes.log; done
  #ls nolio_watchdog.log* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_watchdog.log; done

  generate_analysis_summary
  
}

function combinenac() {
	clear_analysis_folder
  ls DeleteApplication* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/DeleteApplication.log; done
  ls admin* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/admin.log; done
  ls active_mq_nac* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/active_mq_nac.log; done
  ls healthmonitor* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/healthmonitor.log; done
  ls nolio_dispose* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_dispose.log; done
  ls nolio_dm_all* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_dm_all.log; done
  ls nolio_export* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_export.log; done
  ls nolio_perf_mon_nac* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_perf_mon_nac.log; done
  ls nolio_purging* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_purging.log; done
  ls nolio_requests* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/nolio_requests.log; done
  ls statuses_report* | grep -E -v "tar|gz|lck" | sort -Vr | while read line; do cat $line >> ${analysis_folder}/statuses_report.log; done

  generate_analysis_summary
}

function nagupgrade() {

  echo "From NAC and NES (the speicific NES managing these agents): A zip of its logs directory
        Helpful files: agent_upgrade.log"

  echo "From the agent machines with a problem:
        - Export of the Event Viewer System and Application Logs
        - <AgentInstallDirectory>\temp.txt
        - <AgentInstallDirectory>\agent_restart_upgrade.txt
        - <AgentInstallDirectory>\logs\*
        - Recursive directory listing of the agent install folder (dir /s > agenthostname_dir.txt)
        - <AgentInstallDirectory>\conf\*
        - output of this command: tasklist > tasklist.txt
        - restart_agent.sh.out"


}


rlogg() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/loggrep.jar "$@"
}

rlogm() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/logmerge.jar "$@"
}

rlogr() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done

	printf '%s' "From Year [$(date "+%Y")]: "
	read FROM_YEAR
	if [[ -z ${FROM_YEAR} ]]; then
		FROM_YEAR=$(date "+%Y")
	fi
	echo $FROM_YEAR

	#read -a inputmonth -p $'\e[1;33m\e[100mMonth: \e[0m'
	#MONTH=${inputmonth:-$(date "+%m")}
	printf '%s' "From Month [$(date "+%m")]: "
	read FROM_MONTH
	if [[ -z ${FROM_MONTH} ]]; then
		FROM_MONTH=$(date "+%m")
	fi
	echo $FROM_MONTH

	#read -a inputday -p $'\e[1;33m\e[100mDay: \e[0m'
	#DAY=${inputday:-$(date "+%d")}
	printf '%s' "From Day [$(date "+%d")]: "
	read FROM_DAY
	if [[ -z ${FROM_DAY} ]]; then
		FROM_DAY=$(date "+%d")
	fi
	echo $FROM_DAY

	printf '%s' "From Time [ex: 00:00:00,000]: "
	read FROM_TIME
	while [ -z ${FROM_TIME} ]
	do
		printf '%s' "Begin Time [ex: 00:00:00,000]: "
		read FROM_TIME
	done
	echo $FROM_TIME
	
	echo -n "\n"

	printf '%s' "To Year [$(date "+%Y")]: "
	read TO_YEAR
	if [[ -z ${TO_YEAR} ]]; then
		TO_YEAR=$(date "+%Y")
	fi
	echo $TO_YEAR

	#read -a inputmonth -p $'\e[1;33m\e[100mMonth: \e[0m'
	#MONTH=${inputmonth:-$(date "+%m")}
	printf '%s' "To Month [$(date "+%m")]: "
	read TO_MONTH
	if [[ -z ${TO_MONTH} ]]; then
		TO_MONTH=$(date "+%m")
	fi
	echo $TO_MONTH

	#read -a inputday -p $'\e[1;33m\e[100mDay: \e[0m'
	#DAY=${inputday:-$(date "+%d")}
	printf '%s' "To Day [$(date "+%d")]: "
	read TO_DAY
	if [[ -z ${TO_DAY} ]]; then
		TO_DAY=$(date "+%d")
	fi
	echo $TO_DAY
	

	printf '%s' "To Time [ex: 00:00:00,000]: "
	read TO_TIME
	while [ -z ${TO_TIME} ]
	do
		printf '%s' "Begin Time [ex: 00:00:00,000]: "
		read TO_TIME
	done
	echo $TO_TIME

	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/logrange.jar "$@" ${FROM_YEAR}-${FROM_MONTH}-${FROM_DAY}T${FROM_TIME}Z ${TO_YEAR}-${TO_MONTH}-${TO_DAY}T${TO_TIME}Z
}

mx4jdump() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/mx4jdump-1.1-SNAPSHOT-jar-with-dependencies.jar "$@"
}

netdiag() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/chronos-tools/netdiag.jar "$@"
}


ratopology() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/ratopology-1.1-SNAPSHOT-jar-with-dependencies.jar "$@"
}

