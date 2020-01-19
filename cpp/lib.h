#pragma once

// TODO: use std::string_view in C++17.
void error(const char* message) __attribute__ ((noreturn));
void error_open(const char* filename) __attribute__ ((noreturn));
