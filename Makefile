run:Main
	bash -c "./Main +RTS -N --nonmoving-gc >& nonmoving-gc.log"
	bash -c "./Main +RTS -N >& default-gc.log"
	diff nonmoving-gc.log default-gc.log 
Main: Main.hs
	ghc -g Main.hs test.cpp -lstdc++ -rtsopts -threaded
