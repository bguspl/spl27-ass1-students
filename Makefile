# Compiler and flags specified by the assignment
CXX = g++
# -Wall -Weffc++ -std=c++11 -Iinclude are required. 
# -g for debugging is permitted by Section 3.3.
CXXFLAGS = -Wall -Weffc++ -std=c++11 -Iinclude -g

# Automatically find all source files in src/ and map them to object files in bin/
SRCS = $(wildcard src/*.cpp)
OBJS = $(patsubst src/%.cpp, bin/%.o, $(SRCS))

# Default target: builds the server executable
all: bin/server

# Link all object files into the final executable at bin/server
bin/server: $(OBJS)
	g++ -o bin/server $(OBJS)

# Rule to compile each .cpp file into a .o file inside bin/
bin/%.o: src/%.cpp
	g++ $(CXXFLAGS) -c $< -o $@

# Clean rule: removes compiled files from bin/ while keeping the directory itself
clean:
	rm -f bin/*