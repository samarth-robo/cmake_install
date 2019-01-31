#ifndef STRINGADDER_H
#define STRINGADDER_H

#include <string>

class StringAdder {
  private:
    std::string base;

  public:
    StringAdder(std::string base);
    std::string add(std::string);
};

#endif  // STRINGADDER_H
