#include "../lib.h"
#include <algorithm>
#include <fstream>
#include <iostream>
#include <string>

// TODO: use std::string_view in C++17 and std::string_view::starts_with in C++20.
bool starts_with(const std::string& text, const std::string& prefix)
{
  return text.size() >= prefix.size() && std::equal(prefix.begin(), prefix.end(), text.begin());
}

std::string get_filename(const std::string& include)
{
  size_t start = include.find('"');
  size_t end = include.rfind('"');
  if (start > 0 && end > 0 && start < end)
    return include.substr(start+1, end-start-1);
  std::string err = "Can't get filename from " + include;
  error(err.c_str());
}

void finclude(std::istream& f)
{
  std::string line;
  while (getline(f, line)) {
    if (starts_with(line, "#include ")) {
      std::string filename = get_filename(line);
      std::ifstream f1(filename);
      if (!f1)
        error_open(filename.c_str());
      finclude(f1);
    } else {
      printf("%s\n", line.c_str());
    }
  }
}

int main()
{
  finclude(std::cin);
}
