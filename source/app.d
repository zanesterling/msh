import std.stdio;
import std.string;

void main() {
	bool running = true;
	string line;

	while (running) {
		// prompt, get line
		write("> ");
		line = chomp(readln());
		
		// output
		writeln(line);
	}
}
