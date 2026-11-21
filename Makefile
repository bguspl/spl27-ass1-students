CXX = g++
CXXFLAGS = -Wall -Weffc++ -std=c++11 -Iinclude -g

SRCS = $(wildcard src/*.cpp)
HDRS = $(wildcard include/*.h)
OBJS = $(patsubst src/%.cpp, bin/%.o, $(SRCS))

.PHONY: all clean

all: bin/server

bin/server: $(OBJS)
	$(CXX) -o bin/server $(OBJS)

bin/%.o: src/%.cpp $(HDRS)
	@mkdir -p bin
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f bin/*
