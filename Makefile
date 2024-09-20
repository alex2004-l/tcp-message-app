.PHONY: all build clean

CC = g++
CFLAGS = -std=c++17 -Wall -Wextra

SRC_DIR = src
OBJ_DIR = obj

all: build

build: server subscriber

server: $(OBJ_DIR)/server.o $(OBJ_DIR)/common.o
	$(CC) $^ -o $@

$(OBJ_DIR)/server.o: $(SRC_DIR)/server.cpp $(SRC_DIR)/common.hpp
	$(CC) $(CFLAGS) -c $< -o $@

subscriber: $(OBJ_DIR)/common.o $(OBJ_DIR)/subscriber.o
	$(CC) $^ -o $@

$(OBJ_DIR)/subscriber.o: $(SRC_DIR)/subscriber.cpp $(SRC_DIR)/common.hpp
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/common.o: $(SRC_DIR)/common.cpp $(SRC_DIR)/common.hpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ_DIR)/*.o server subscriber
