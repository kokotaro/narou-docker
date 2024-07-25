#!/bin/sh

if [ ! -e /home/narou/novel/.narou ]; then
  mkdir .narou
  mkdir -p .narousetting
  {
    echo "---";
    echo 'aozoraepub3dir: "/opt/aozoraepub3"';
    echo 'over18: true';
    echo "server-port: ${NAROU_PORT}";
    echo 'server-bind: 0.0.0.0';
  } | tee .narousetting/global_setting.yaml

  {
    echo "---";
    echo "already-server-boot: true";
  } | tee .narousetting/server_setting.yaml

  narou s convert.no-open=true
fi

exec "$@"
