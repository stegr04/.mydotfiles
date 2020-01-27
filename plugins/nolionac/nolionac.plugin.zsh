
function cd_nac_pr() {
  cd /opt/nolio/prod/nac
}

function down_nac_pr() {
  cd /opt/nolio/prod/nac
  ./nolio_server.sh stop
}

function up_nac_pr() {
  cd /opt/nolio/prod/nac
  ./nolio_server.sh stop
}

function clear_nac_pr() {
  downnpr
  cd /opt/nolio/prod/nac
  rm -rf ./logs/*
}

function clear_nacpr_all() {
  downnpr
  /opt/nolio/prod/nac
  rm -rf ./logs/*
  rm -rf ./temp
  rm -rf ./activemq-data/nac/LevelDB

}

function cd_nac_te() {
  cd /opt/nolio/test/nac
}

function down_nac_te() {
  cd /opt/nolio/test/nac
  ./nolio_server.sh stop
}

function up_nac_te() {
  cd /opt/nolio/test/nac
  ./nolio_server.sh stop
}

function clear_nac_te() {
  cd /opt/nolio/test/nac
  rm -rf ./logs/*
}

function clear_nacte_all() {
  downnpr
  /opt/nolio/test/nac
  rm -rf ./logs/*
  rm -rf ./temp
  rm -rf ./activemq-data/nac/LevelDB
  
}