import std.stdio;

void main() {
	bool running = true;
	char[] line;

	while (running) {
		write("> ");
		readln(line);
		write(line);
	}
}
