
function clear_analysis_folder() {
	# SET ANALYSIS FOLDER/FILE
	analysis_folder="ANALYSIS"
	analysis_file_summary=${analysis_folder}/all_combinenac.out
	if [ ! -d $analysis_folder ]; then {
    	#Create directory
    		mkdir $analysis_folder
	} else {
    		rm -rf ${analysis_folder}
    		mkdir ${analysis_folder}
	}
	fi
}

# Functions that help gather frequently reviewed logs into one inclusive file (per file type: nimi.log, nimi.log.1, etc.. > all_nimi.log)
function combinenag() {
  rm all_combinenag.out all_nimi.log all_nolio_action_exe.log all_nolio_all.log
	ls nimi* | sort -Vr | while read line; do cat $line >> all_nimi.log; done
	ls nolio_action_exe* | sort -Vr | while read line; do cat $line >> all_nolio_action_exe.log; done
	ls nolio_all* | sort -Vr | while read line; do cat $line >> all_nolio_all.log; done
  echo "jboss.awk all_nimi.log | less -+S" > all_combinenag.out
  echo "jboss.awk all_nolio_action_exe.log | less -+S" >> all_combinenag.out
  echo "jboss.awk all_nolio_all.log | less -+S" >> all_combinenag.out
  cat all_combinenag.out

}

function combinenes() {
  rm all_combinenes.out all_active_mq_nes.log all_execution.log all_nimi.log all_nolio_exec_all.log
  ls active_mq_nes* | sort -Vr | while read line; do cat $line >> all_active_mq_nes.log; done
  ls execution* | sort -Vr | while read line; do cat $line >> all_execution.log; done
  ls nimi* | sort -Vr | while read line; do cat $line >> all_nimi.log; done
  ls nolio_exec_all* | sort -Vr | while read line; do cat $line >> all_nolio_exec_all.log; done
  ls nolio_perf_mon_nes* | sort -Vr | while read line; do cat $line >> all_perfmon_nes.log; done
  echo "jboss.awk all_active_mq_nes.log | less -+S" > all_combinenes.out
  echo "jboss.awk all_execution.log | less -+S" >> all_combinenes.out
  echo "jboss.awk all_nimi.log | less -+S" >> all_combinenes.out
  echo "jboss.awk all_nolio_exec_all.log | less -+S" >> all_combinenes.out
  echo "jboss.awk all_perfmon_nes.log | less -+S" >> all_combinenes.out
  cat all_combinenes.out
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

  echo "jboss.awk ${analysis_folder}/DeleteApplication.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/admin.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/active_mq_nac.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/healthmonitor.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_dispose.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_dm_all.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_export.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_perf_mon_nac.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_purging.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/nolio_requests.log | less -+S" >> ${analysis_file_summary}
  echo "jboss.awk ${analysis_folder}/status_report.log | less -+S" >> ${analysis_file_summary}

  cat ${analysis_file_summary}
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


# Set path to include location of ReleaseAutomationAnalysis folder.
export PATH=${PATH}:${HOME}/opt/ReleaseAutomationAnalysis:${HOME}/opt/ReleaseAutomationAnalysis/TroubleShooting

