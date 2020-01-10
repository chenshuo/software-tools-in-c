ANTLR=$(HOME)/jars/antlr-4.7.2-complete.jar
CLANG_FORMAT=clang-format
JAR=/usr/lib/jvm/default-java/bin/jar
JAVA=/usr/lib/jvm/default-java/bin/java
JAVAC=/usr/lib/jvm/default-java/bin/javac
ARGS?=$(wildcard orig/intro/*.p)

all: bin/p2c.jar

bin/p2c.jar: $(wildcard p2c/*.java) p2c/PascalParser.java
	$(JAVAC) -cp $(ANTLR) -d bin -sourcepath . p2c/Convert.java
	$(JAR) cf $@ -C bin/ p2c/

p2c/PascalParser.java: Pascal.g4
	$(JAVA) -jar $(ANTLR) -o p2c -package p2c $< -no-listener -visitor

run: bin/p2c.jar
	$(JAVA) -ea -cp $(ANTLR):bin/p2c.jar p2c.Convert $(ARGS) | ./unpack.py -
	$(CLANG_FORMAT) --style=WebKit -i orig/*/*.cc

#
#  C++
#

SRCS=$(wildcard cpp/*/*.cc)
BINS=$(patsubst cpp/%,bin/%,$(basename $(SRCS)))

bin/% : cpp/%.cc
	@mkdir -p $(dir $@)
	g++ -g -Wall $^ -o $@

tests: $(BINS)
	cd cpp && ./test.py

