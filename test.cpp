#include "test.h"
#include <cstdio>

std::vector<int>* init_vector(){
  return new std::vector<int>();
}

void delete_vector(std::vector<int>* object){
  printf("delete\n");
  fflush(stdout);
  delete object;
}

int size_vector(std::vector<int>* object){
  return object->size();
}
