import mode;

struct ShellState {
	bool running = true;
	ShellMode mode = ShellMode.INSERT;
};
