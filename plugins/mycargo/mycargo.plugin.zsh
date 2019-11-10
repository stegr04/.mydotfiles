#
#===============================================================================
#
#          FILE: mycargo.plugin.sh
#
#         USAGE: ./mycargo.plugin.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Gregg Stewart (), 
#  ORGANIZATION: 
#       CREATED: 11/10/2019 00:13:20
#      REVISION:  ---
#===============================================================================

if [ -d ${HOME}/.cargo/bin ]; then {
	PATH=${PATH}:${HOME}/.cargo/bin
}
fi
