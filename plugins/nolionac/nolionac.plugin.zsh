
function cdnacpr() {
  cd /opt/nolio/prod/nac
}

function downacnpr() {
  cd /opt/nolio/prod/nac
  ./nolio_server.sh stop
}

function upnacpr() {
  cd /opt/nolio/prod/nac
  ./nolio_server.sh stop
}

function clear_nacpr() {
  downnpr
  cd /opt/nolio/prod/nac
  rm -rf ./logs/*
}

function clear_nacpr_all() {
  downnpr
  /opt/nolio/prod/nac
  rm -rf ./logs/*
  rm -rf ./test
  rm -rf ./activemq
}

function cdnte() {
  cd /opt/nolio/test/nac
}

function downnpr() {
  cd /opt/nolio/test/nac
  ./nolio_server.sh stop
}

function upnpr() {
  cd /opt/nolio/test/nac
  ./nolio_server.sh stop
}

function clearnpr() {
  cd /opt/nolio/test/nac
  rm -rf ./logs/*
}
