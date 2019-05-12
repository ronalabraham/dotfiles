#!/usr/bin/env sh

server=/Users/rabraham5/.eclipse.jdt.ls

java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -noverify \
    -Xms1G \
    -jar $server/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.*.jar \
    -configuration $server/org.eclipse.jdt.ls.product/target/repository/config_mac/ \
    "$@"
