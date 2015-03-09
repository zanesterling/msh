import std.stdio;
import std.string;
import state;

void main() {
	ShellState state;
	string line;

	while (state.running) {
		// prompt, get line
		write("> ");
		line = chomp(readln());
		
		// output
		writeln(line);

		parse(state, line);
	}
}

void parse(ref ShellState state, string line) {}
