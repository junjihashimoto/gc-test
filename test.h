#include <vector>
#include <iostream>

extern "C" {
  std::vector<int>* init_vector();
  void delete_vector(std::vector<int>* object);
  int size_vector(std::vector<int>* object);
}
