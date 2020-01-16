ANTLR=$(HOME)/jars/antlr-4.7.2-complete.jar
CLANG_FORMAT=clang-format
CXX?=g++
JAR=/usr/lib/jvm/default-java/bin/jar
JAVA=/usr/lib/jvm/default-java/bin/java
JAVAC=/usr/lib/jvm/default-java/bin/javac
ARGS?=$(wildcard orig/intro/*.p) \
      $(wildcard orig/filters/*.p) \
      $(wildcard orig/translit/*.p)

SRCS=$(wildcard cpp/*/*.cc)
BINS=$(patsubst cpp/%,bin/%,$(basename $(SRCS))) \
     bin/filters/overstrike \
     bin/filters/compress \
     bin/filters/expand \
     bin/translit/translit

all: $(BINS)

bin/p2c.jar: $(wildcard p2c/*.java) p2c/PascalParser.java
	$(JAVAC) -cp $(ANTLR) -d bin -sourcepath . p2c/Convert.java
	$(JAR) cf $@ -C bin/ p2c/

p2c/PascalParser.java: Pascal.g4
	$(JAVA) -jar $(ANTLR) -o p2c -package p2c $< -no-listener -visitor

convert: bin/p2c.jar
	$(JAVA) -ea -cp $(ANTLR):bin/p2c.jar p2c.Convert $(ARGS) | ./unpack.py
	$(CLANG_FORMAT) --style="{BasedOnStyle: WebKit, SpacesBeforeTrailingComments: 2, SortIncludes: false}" -i orig/*/*.cc

#
#  C++
#

bin/% : cpp/%.cc
	@mkdir -p $(dir $@)
	$(CXX) -O2 -g -Wall -Wextra $^ -o $@

bin/filters/overstrike: orig/filters/overstrike.cc orig/lib.cc orig/util/max.cc
	$(CXX) -O2 -g -Wall -Wextra $^ -o $@ -DMAIN=$(notdir $@)

bin/filters/compress: orig/filters/compress.cc orig/filters/putrep.cc orig/lib.cc orig/util/min.cc
	$(CXX) -O2 -g -Wall -Wextra $^ -o $@ -DMAIN=$(notdir $@)

bin/filters/expand: orig/filters/expand.cc orig/lib.cc
	$(CXX) -O2 -g -Wall -Wextra $^ -o $@ -DMAIN=$(notdir $@)

bin/translit/translit: $(wildcard orig/translit/*.cc) orig/util/addstr.cc orig/util/length.cc orig/util/index.cc orig/util/esc.cc orig/lib.cc
	@mkdir -p bin/translit
	$(CXX) -O2 -g -Wall -Wextra $^ -o $@ -DMAIN=$(notdir $@)

tests: $(BINS)
	cd cpp && ./test.py $(TEST)

clean:
	rm -rf $(BINS) bin/p2c* p2c/Pascal*
