#!/bin/sh
#
# external_rules_command
#
# Absolute path to the command used to retrieve rule consequences.
# The command will receive the following arguments: window ID, class
# name, instance name, and intermediate consequences. The output of
# that command must have the following format: key1=value1
# key2=value2 ...  (the valid key/value pairs are given in the
# description of the rule command).
#
#
# Rule
#    General Syntax
# 	   rule COMMANDS
#
#    Commands
# 	   -a, --add (<class_name>|*)[:(<instance_name>|*)] [-o|--one-shot]
# 	   [monitor=MONITOR_SEL|desktop=DESKTOP_SEL|node=NODE_SEL]
# 	   [state=STATE] [layer=LAYER] [split_dir=DIR] [split_ratio=RATIO]
# 	   [(hidden|sticky|private|locked|marked|center|follow|manage|focus|border)=(on|off)]
# 	   [rectangle=WxH+X+Y]
# 		   Create a new rule.
#
# 	   -r, --remove
# 	   ^<n>|head|tail|(<class_name>|*)[:(<instance_name>|*)]...
# 		   Remove the given rules.
#
# 	   -l, --list
# 		   List the rules.

border= \
center= \
class=$2 \
desktop= \
focus= \
follow= \
hidden= \
id=${1?} \
instance=$3 \
layer= \
locked= \
manage= \
marked= \
misc=$4 \
monitor= \
node= \
private= \
rectangle= \
split_dir= \
split_ratio= \
state= \
sticky= \
urgent=;

spotify() {
	desktop=^6;
}

case $instance.$class in
	(*.Spotify) spotify;;
	(.)
		case $(ps -p "$(xdo pid "$id")" -o comm= 2>/dev/null) in
			(spotify) spotify;;
		esac;;
esac;

printf \
	${border:+"border=$border"} \
	${center:+"center=$center"} \
	${desktop:+"desktop=$desktop"} \
	${focus:+"focus=$focus"} \
	${follow:+"follow=$follow"} \
	${hidden:+"hidden=$hidden"} \
	${layer:+"layer=$layer"} \
	${locked:+"locked=$locked"} \
	${manage:+"manage=$manage"} \
	${marked:+"marked=$marked"} \
	${monitor:+"monitor=$monitor"} \
	${node:+"node=$node"} \
	${private:+"private=$private"} \
	${rectangle:+"rectangle=$rectangle"} \
	${split_dir:+"split_dir=$split_dir"} \
	${split_ratio:+"split_ratio=$split_ratio"} \
	${state:+"state=$state"} \
	${sticky:+"sticky=$sticky"} \
	${urgent:+"urgent=$urgent"};

# vim: set ft=sh :
