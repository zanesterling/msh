import std.stdio;
import std.string;

void main() {
	bool running = true;
	char[] line;

	while (running) {
		// prompt, get line
		write("> ");
		readln(line);
		line = chomp(line);
		
		// output
		writeln(line);
	}
}
