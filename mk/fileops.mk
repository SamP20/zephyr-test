
ifeq ($(OS),Windows_NT)
	RMDIR:=rmdir /s /q
else
	RMDIR:=rm -rf
endif