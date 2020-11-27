{
	if (match($0, /([0-9\.]*):34(78|79|81)/,m)||match($0, /([0-9\.]*):500([0-9][0-9])/,m)) {
		if (m[1] != h) {
			print "Testing address " m[1] " (" $5 ")"
			system("whois  52.113.125.246 | egrep -i '^(orgname|orgid)'")
			system("mtr -c 3 -r " m[1])
		}
		close(m[1])
	}
}
