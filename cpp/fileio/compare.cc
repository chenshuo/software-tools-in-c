#include "../lib.h"
#include <stdlib.h>
#include <fstream>
#include <string>

void diffmsg(int lineno, const std::string& line1, const std::string& line2)
{
  printf("%d:\n", lineno);
  printf("%s\n", line1.c_str());
  printf("%s\n", line2.c_str());
}

int main(int argc, const char* argv[])
{
  if (argc != 3)
    error("Usage: compare file1 file2");

  std::ifstream infile1(argv[1]);
  if (!infile1)
    error_open(argv[1]);

  std::ifstream infile2(argv[2]);
  if (!infile2)
    error_open(argv[2]);

  int lineno = 0;
  bool f1 = false, f2 = false;
  bool diff = false;
  do {
    ++lineno;
    std::string line1, line2;
    f1 = static_cast<bool>(std::getline(infile1, line1));
    f2 = static_cast<bool>(std::getline(infile2, line2));
    if (f1 && f2)
      if (line1 != line2) {
        diffmsg(lineno, line1, line2);
        diff = true;
      }
  } while (f1 && f2);

  if (f2 && !f1)
    error("compare: end of file on file1");
  else if (f1 && !f2)
    error("compare: end of file on file2");

  return diff ? EXIT_FAILURE : EXIT_SUCCESS;
}
