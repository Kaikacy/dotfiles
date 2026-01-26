#!/usr/bin/env dash

# jq can return more than one value, separated by newline, with , (comma) operator
# we can directly get first element of active output's 'focus' list, as it's always id of current workspace
{
	read CURR_OUTPUT_ID
	read CURR_WORKSPACE_ID
} << EOF
$(swaymsg -t get_outputs | jq '.[] | select(.focused).id, .focus[0]')
EOF

# because of ^ this, we don't need to search nodes recursively
readonly CURR_WORKSPACE_TREE=$(swaymsg -t get_tree \
			       | jq '.nodes[] | select(.id == '$CURR_OUTPUT_ID').nodes[] | select(.id == '$CURR_WORKSPACE_ID')')

echo "$CURR_WORKSPACE_TREE" \
	| jq --raw-output 'recurse(.nodes[]) | select(.visible).rect | "\(.x),\(.y) \(.width)x\(.height)"' \
	| slurp
