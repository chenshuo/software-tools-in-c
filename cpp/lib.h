#pragma once
#include <stdio.h>

// TODO: use std::string_view in C++17.
void error(const char* message) __attribute__ ((noreturn));
void error_open(const char* filename) __attribute__ ((noreturn));

// An RAII handle for FILE*.
class File
{
 public:
  File(const char* filename, const char* mode)
    : file_(fopen(filename, mode))
  {
    if (file_ == nullptr)
      error_open(filename);
  }

  File(const File&) = delete;
  void operator=(const File&) = delete;
  // TODO: Add move ctor

  ~File()
  {
    fclose(file_);
  }

  FILE* get() { return file_; }

 private:
  FILE* file_ = nullptr;
};

void fcopy(FILE* fin, FILE* fout);
