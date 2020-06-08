Main: Main.hs
	ghc -g Main.hs test.cpp -lstdc++ -rtsopts -threaded
