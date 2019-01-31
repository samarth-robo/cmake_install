#include "StringAdder.h"

using namespace std;


StringAdder::StringAdder(string base) : base(base) {}


string StringAdder::add(string s) {
  return base + s;
}
