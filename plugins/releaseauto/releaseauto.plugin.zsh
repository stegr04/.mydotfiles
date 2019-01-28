
# Functions that help gather frequently reviewed logs into one inclusive file (per file type: nimi.log, nimi.log.1, etc.. > all_nimi.log)
function combinenag() {
  rm all_combinenag.out all_nimi.log all_nolio_action_exe.log all_nolio_all.log
	ls nimi* | sort -Vr | while read line; do cat $line >> all_nimi.log; done
	ls nolio_action_exe* | sort -Vr | while read line; do cat $line >> all_nolio_action_exe.log; done
	ls nolio_all* | sort -Vr | while read line; do cat $line >> all_nolio_all.log; done
  echo "jboss.awk nimi_all.log | less -+S" > all_combinenag.out
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
  echo "jboss.awk all_active_mq_nes.log | less -+S" > all_combinenes.out
  echo "jboss.awk all_execution.log | less -+S" >> all_combinenes.out
  echo "jboss.awk all_nimi.log | less -+S" >> all_combinenes.out
  echo "jboss.awk all_nolio_exec_all | less -+S" >> all_combinenes.out
  cat all_combinenes.out
}

function combinenac() {
  rm all_combinenac.out all_nolio_dm_all.log all_nolio_export.log all_nolio_dispose.log all_nolio_requests.log all_active_mq_nac.log all_statuses_report.log
  ls nolio_dm_all* | sort -Vr | while read line; do cat $line >> all_nolio_dm_all.log; done
  ls nolio_export* | sort -Vr | while read line; do cat $line >> all_nolio_export.log; done
  ls nolio_dispose* | sort -Vr | while read line; do cat $line >> all_nolio_dispose.log; done
  ls nolio_requests* | sort -Vr | while read line; do cat $line >> all_nolio_requests.log; done
  ls active_mq_nac* | sort -Vr | while read line; do cat $line >> all_active_mq_nac.log; done
  ls statuses_report* | sort -Vr | while read line; do cat $line >> all_statuses_report.log; done

  echo "jboss.awk all_nolio_dm_all.log | less -+S" > all_combinenac.out
  echo "jboss.awk all_nolio_export.log | less -+S" >> all_combinenac.out
  echo "jboss.awk all_nolio_dispose.log | less -+S" >> all_combinenac.out
  echo "jboss.awk all_nolio_requests.log | less -+S" >> all_combinenac.out
  echo "jboss.awk all_active_mq_nac.log | less -+S" >> all_combinenac.out
  echo "jboss.awk all_statuses_report.log | less -+S" >> all_combinenac.out
  cat all_combinenac.out
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
export PATH=${PATH}:${HOME}/opt/ReleaseAutomationAnalysis

