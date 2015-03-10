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
	string[] tokens = tokenize(line);

	switch (tokens[0]) {
		case "pwd":
			writeln(getcwd());
			break;
		case "ls":
			ls();
			break;
		case "cd":
			cd(tokens);
			break;
		case "exit":
			state.running = false;
			break;
		default:
			break;
	}
}

string[] tokenize(string line) {
	string[] tokens = line.split(" ");
	return tokens;
}

void ls() {
	foreach (string dirname; dirEntries(".", SpanMode.shallow)) {
		string trimmed = dirname[2 .. $];
		writeln(" ", trimmed);
	}
}

void cd(string[] tokens) {
	if (tokens.length < 2) writeln("cd: must provide a target dir");
	else chdir(tokens[1]);
}
