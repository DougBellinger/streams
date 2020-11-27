{
	if (match($0, /([0-9\.]*):34(78|79|81)/,m)) {
		print m[1]
		system("mtr -c 1 -r " m[1])
		close(m[1])
	}
	if (match($0, /([0-9\.]*):500([0-9][0-9])/,m)) {
		print m[1]
		system("mtr -c 1 -r " m[1])
		close(m[1])
	}
}
