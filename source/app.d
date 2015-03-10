import std.file;
import std.stdio;
import std.string;
import state;

void main() {
	ShellState state;
	string line;

	while (state.running) {
		// prompt, get line
		write("msh$ ");
		line = chomp(readln());
		
		// output
		parse(state, line);
	}
}

void parse(ref ShellState state, string line) {
	switch (line) {
		case "pwd":
			writeln(getcwd());
			break;
		case "ls":
			ls();
			break;
		case "exit":
			state.running = false;
			break;
		default:
			break;
	}
}

void ls() {
	foreach (string dirname; dirEntries(".", SpanMode.shallow)) {
		string trimmed = dirname[2..$];
		writeln(trimmed);
	}
}
