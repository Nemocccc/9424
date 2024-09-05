SRC_DIR = ./src
BUILD_DIR = ./build
TARGET = $(BUILD_DIR)/test.out

CFLAGS = -Wall

.PHONY: printdir all clean

# ./src/*.cpp
SRCS = $(shell find $(SRC_DIR) -name '*.cpp')
# ./src/*.cpp -> ./build/*.o
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))
# ./src/*.cpp -> ./build/*.d
DEPS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.d, $(SRCS))

# default target
all: $(TARGET) printdir

printdir: # print current working dir
	@echo "Current Directory: $(CURDIR)"  

$(BUILD_DIR)/%.d: $(SRC_DIR)/%.cpp # pattern rule, represent that .d files in build/ is built by the corresponding .cpp files in src/
	@mkdir -p $(dir $@); \ 
	rm -f $@; \
	g++ -MM $< > $@.tmp; \
	sed 's, \($*\)\.o[ :]*, \1.o $@ : , g' < $@.tmp > $@; \
	rm -f $@.tmp
	
# parameter -p ensure that before making target dictionary, its father dir has exist,
# $(dir $@)is the target file's dictinary, for example, build/ for build/main.default
# parameter -MM finds out the prerequisites of target files, $< refer to the first prerequisites, > $@.tmp redirect output to target .d file's temporary version
# sed: stream editor; s: replace mode; g: global
# \($*\)\.o[ :]*: regex grammar, autonymy `\` here aims to diliver ()  to sed editor accurately without interpreted by shell.
# 	$*: auto-parameter for makefile, represent the basic name of file(without prefix and suffix)
# < $@.tmp: set $@.tmp(target.tmp) as input files
# > $@: write outputs in target file.

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	g++ $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJS)   #generate test.out
	@echo "building $@..."
	@mkdir -p $(dir $@)
	g++ -o $(TARGET) $(OBJS)

clean:
	@echo "clean ..."
	rm -rf $(BUILD_DIR)

-include $(DEPS) # include all the prerequisites in makefile can help make better update(why? i dont know)