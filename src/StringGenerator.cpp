#include "StringAdder.h"
#include <iostream>

using namespace std;

int main (int argc, char **argv) {
  if (argc != 2) {
    cout << "Usage ./" << argv[0] << " some_string" << endl;
    return -1;
  }
  
  StringAdder sa("cmake");
  string out = sa.add(argv[1]);
  cout << "Output is " << out << endl;
  
  return 0;
}
