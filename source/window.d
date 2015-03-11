import std.algorithm;

import deimos.ncurses.ncurses;

class Window {
	int cols, rows;
	char[][] lines;

	this() {
		cols = 20;
		rows = 20;

		initscr();
		.refresh();
	}

	void pushLine(char[] line) {
		lines ~= line;
		if (lines.length > rows)
			lines.remove(0);
	}

	void popLine() {
		lines = lines.remove(lines.length - 1);
	}

	// write everything in lines to the screen
	void refresh() {
		clear();

		for (int i = 0; i < lines.length; i++)
			mvprintw(i, 0, lines[i].ptr);

		.refresh();
	}
};
