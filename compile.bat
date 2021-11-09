del game.exe
as.exe --defsym _WINDOWS_=1 game.asm -o game.o
gcc.exe game.o -o game.exe -I include/ -L lib/ -lraylib -lopengl32 -lgdi32 -lwinmm
del game.o

start game.exe